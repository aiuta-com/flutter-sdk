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

final class UpdateActiveAiutaProductHandlerImpl: AiutaCallHandler {
    let method = "updateActiveAiutaProduct"
    let dataProvider: AiutaDataProvider
    let basket: AiutaBasket

    init(with dataProvider: AiutaDataProvider, basket: AiutaBasket) {
        self.dataProvider = dataProvider
        self.basket = basket
    }

    func handle(_ call: FlutterMethodCall) throws {
        let product: AiutaPlugin.Product = try call.decodeArgument(AiutaPlugin.Product.key)
        basket.putProduct(product)
        dataProvider.setProduct(product.buildProduct(), isInWishlist: product.inWishlist)
    }
}
