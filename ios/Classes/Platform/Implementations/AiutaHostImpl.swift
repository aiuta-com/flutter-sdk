// Copyright 2024 Aiuta USA, Inc
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import AiutaSdk

final class AiutaHostImpl: AiutaHost {
    var delegate: AiutaSdkDelegate { self }

    @available(iOS 13.0.0, *)
    var controller: AiutaDataController { self }

    var dataProvider: AiutaDataProvider { self }

    @available(iOS 13.0.0, *)
    var jwtProvider: AiutaJwtProvider { self }

    var jwtResult: AiutaCompleter<String>? {
        didSet { oldValue?.cancel() }
    }

    var deleteUploadedResults = [AiutaCompleter<Void>]()
    var deleteGeneratedResults = [AiutaCompleter<Void>]()

    private var sdkDataProvider: AiutaDataProvider?
    private let jwtStreamer: AiutaJwtStreamer?
    private let actionsStreamer: AiutaActionsStreamer?
    private let dataActionsStreamer: AiutaDataActionsStreamer?
    private let analyticsStreamer: AiutaAnalyticsStreamer?

    init(with streamers: [AiutaStreamHandler]) {
        actionsStreamer = streamers.getHandler()
        jwtStreamer = streamers.getHandler()
        analyticsStreamer = streamers.getHandler()
        dataActionsStreamer = streamers.getHandler()
    }

    func handle(error: AiutaPlugin.FlutterError) {
        switch error.errorType {
            case .failedDeleteUploadedImages:
                deleteUploadedResults.popLast()?.failure(error)
            case .failedDeleteGeneratedImages:
                deleteGeneratedResults.popLast()?.failure(error)
        }
    }
}

@available(iOS 13.0.0, *)
extension AiutaHostImpl: AiutaJwtProvider {
    @MainActor public func getJwt(requestParams params: [String: String]) async throws -> String {
        guard let data = try? JSONEncoder().encode(params),
              let request = String(data: data, encoding: .utf8) else {
            throw AiutaCompleter<String>.ErrorType.failed
        }
        let completer = AiutaCompleter<String>()
        jwtResult = completer
        jwtStreamer?.requestJwt(request)
        return try await completer.result
    }
}

extension AiutaHostImpl: AiutaSdkDelegate {
    public func aiuta(addToWishlist skuId: String) {
        actionsStreamer?.addToWishlist(skuId)
    }

    public func aiuta(addToCart skuId: String) {
        actionsStreamer?.addToCart(skuId)
    }

    public func aiuta(showSku skuId: String) {}

    public func aiuta(eventOccurred event: Aiuta.Event) {
        analyticsStreamer?.eventOccurred(event)
    }
}

@available(iOS 13.0.0, *)
extension AiutaHostImpl: AiutaDataController {
    func setData(provider: AiutaDataProvider) {
        sdkDataProvider = provider
    }

    func obtainUserConsent() {
        dataActionsStreamer?.obtainUserConsent()
    }

    @MainActor func addUploaded(images: [Aiuta.Image]) async throws {
        dataActionsStreamer?.addUploadedImages(images)
    }

    @MainActor func selectUploaded(image: Aiuta.Image) async throws {
        dataActionsStreamer?.selectUploadedImage(image)
    }

    @MainActor func deleteUploaded(images: [Aiuta.Image]) async throws {
        let completer = AiutaCompleter<Void>()
        deleteUploadedResults.insert(completer, at: 0)
        dataActionsStreamer?.deleteUploadedImages(images)
        try await completer.result
    }

    @MainActor func addGenerated(images: [Aiuta.Image]) async throws {
        dataActionsStreamer?.addGeneratedImages(images)
    }

    @MainActor func deleteGenerated(images: [Aiuta.Image]) async throws {
        let completer = AiutaCompleter<Void>()
        deleteGeneratedResults.insert(completer, at: 0)
        dataActionsStreamer?.deleteGeneratedImages(images)
        try await completer.result
    }
}

extension AiutaHostImpl: AiutaDataProvider {
    var isUserConsentObtained: Bool {
        get { sdkDataProvider?.isUserConsentObtained ?? false }
        set { sdkDataProvider?.isUserConsentObtained = newValue }
    }

    var uploadedImages: [Aiuta.Image] {
        get { sdkDataProvider?.uploadedImages ?? [] }
        set {
            deleteUploadedResults.popLast()?.success()
            sdkDataProvider?.uploadedImages = newValue
        }
    }

    var generatedImages: [Aiuta.Image] {
        get { sdkDataProvider?.generatedImages ?? [] }
        set {
            deleteGeneratedResults.popLast()?.success()
            sdkDataProvider?.generatedImages = newValue
        }
    }

    func setProduct(_ product: Aiuta.Product, isInWishlist: Bool) {
        sdkDataProvider?.setProduct(product, isInWishlist: isInWishlist)
    }
}
