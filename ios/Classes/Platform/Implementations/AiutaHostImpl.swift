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

final class AiutaHostImpl {
    private let jwtStreamer: AiutaJwtStreamer?
    private let actionsStreamer: AiutaActionsStreamer?
    private var jwtResultCallback: AiutaJwtResultCallback?

    init(with streamers: [AiutaStreamHandler]) {
        actionsStreamer = streamers.getHandler()
        jwtStreamer = streamers.getHandler()
    }

    private func requestJwt(_ params: [String: String], _ callback: @escaping AiutaJwtResultCallback) {
        jwtResultCallback?(.failure(AiutaJwtError.cancel))
        guard let data = try? JSONEncoder().encode(params),
              let request = String(data: data, encoding: .utf8) else {
            callback(.failure(AiutaJwtError.failed))
            return
        }
        jwtResultCallback = callback
        jwtStreamer?.requestJwt(request)
    }
}

extension AiutaHostImpl: AiutaHost {
    var delegate: AiutaSdkDelegate { self }

    @available(iOS 13.0.0, *)
    var jwtProvider: AiutaJwtProvider { self }

    func returnJwtResult(_ result: AiutaJwtResult) {
        jwtResultCallback?(result)
        jwtResultCallback = nil
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

    public func aiuta(eventOccurred event: Aiuta.SdkEvent) {}
}

@available(iOS 13.0.0, *)
extension AiutaHostImpl: AiutaJwtProvider {
    public func getJwt(requestParams: [String: String]) async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            requestJwt(requestParams) { result in
                switch result {
                    case let .success(token): continuation.resume(returning: token)
                    case let .failure(error): continuation.resume(throwing: error)
                }
            }
        }
    }
}
