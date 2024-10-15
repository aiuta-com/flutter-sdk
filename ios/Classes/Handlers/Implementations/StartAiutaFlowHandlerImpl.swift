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

final class StartAiutaFlowHandlerImpl: AiutaViewFinder, AiutaCallHandler {
    let method = "startAiutaFlow"
    let basket: AiutaBasket
    let host: AiutaHost

    init(with host: AiutaHost, basket: AiutaBasket) {
        self.basket = basket
        self.host = host
    }

    func handle(_ call: FlutterMethodCall) throws {
        guard #available(iOS 13.0.0, *) else { throw AiutaPluginError.unsupportedPlatform }
        guard let currentViewController else { throw AiutaPluginError.invalidViewState }

        let configuration: AiutaPlugin.Configuration = try call.decodeArgument(AiutaPlugin.Configuration.key)
        let product: AiutaPlugin.Product = try call.decodeArgument(AiutaPlugin.Product.key)

        basket.removeAll()
        basket.putProduct(product)

        Aiuta.setup(
            auth: try configuration.buildAuth(host.jwtProvider),
            configuration: configuration.buildConfiguration()
        )

        Aiuta.tryOn(
            sku: product.buildProduct(),
            in: currentViewController,
            delegate: host.delegate
        )
    }
}
