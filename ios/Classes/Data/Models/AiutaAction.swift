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

extension AiutaPlugin {
    enum Actions {
        struct AddToCartAction: Encodable {
            let type: Method = .addToCartClick
            let product: Product
        }

        struct AddToWishlistAction: Encodable {
            let type: Method = .addToWishlistClick
            let product: Product
        }

        struct RequestJwtAction: Encodable {
            let type: Method = .requestJwt
            let params: String
        }

        struct ObtainUserConsentAction: Encodable {
            let type: Method = .obtainUserConsent
            let supplementaryConsents: [Aiuta.Consent]
        }

        struct AddUploadedImagesAction: Encodable {
            let type: Method = .addUploadedImages
            let uploadedImages: [Aiuta.Image]
        }

        struct DeleteUploadedImagesAction: Encodable {
            let type: Method = .deleteUploadedImages
            let uploadedImages: [Aiuta.Image]
        }

        struct SelectUploadedImageAction: Encodable {
            let type: Method = .selectUploadedImage
            let uploadedImage: Aiuta.Image
        }

        struct AddGeneratedImagesAction: Encodable {
            let type: Method = .addGeneratedImages
            let productId: String
            let generatedImages: [Aiuta.Image]
        }

        struct DeleteGeneratedImagesAction: Encodable {
            let type: Method = .deleteGeneratedImages
            let generatedImages: [Aiuta.Image]
        }
    }
}

extension AiutaPlugin.Actions {
    enum Method: String, Encodable {
        case addToCartClick, addToWishlistClick,
             obtainUserConsent,
             addUploadedImages, deleteUploadedImages, selectUploadedImage,
             addGeneratedImages, deleteGeneratedImages,
             requestJwt = "requestJWT"
    }
}
