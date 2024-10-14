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
import Flutter

final class StartAiutaFlowHandler: AiutaViewFinder, AiutaHandler {
    let method = "startAiutaFlow"

    func handle(_ call: FlutterMethodCall) throws {
        guard #available(iOS 13.0.0, *) else { throw AiutaPluginError.unsupportedPlatform }
        guard let currentViewController else { throw AiutaPluginError.invalidViewState }

        let configuration = try call.decodeArgument(AiutaPlugin.Configuration.self, key: AiutaPlugin.Configuration.key)
        let product = try call.decodeArgument(AiutaPlugin.Product.self, key: AiutaPlugin.Product.key)

        Aiuta.setup(
            auth: try configuration.buildAuth(self),
            configuration: configuration.buildConfiguration()
        )

        Aiuta.tryOn(
            sku: product.buildProduct(),
            in: currentViewController,
            delegate: self
        )
    }
}

extension StartAiutaFlowHandler: AiutaSdkDelegate {
    public func aiuta(addToWishlist skuId: String) {}

    public func aiuta(addToCart skuId: String) {}

    public func aiuta(showSku skuId: String) {}

    public func aiuta(eventOccurred event: Aiuta.SdkEvent) {}
}

@available(iOS 13.0.0, *)
extension StartAiutaFlowHandler: AiutaJwtProvider {
    public func getJwt(requestParams: [String: String]) async throws -> String {
        return ""
    }
}
