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
    struct ProductAction: Encodable {
        let type: Method
        let product: Product
    }

    struct RequestJwtAction: Encodable {
        let type: Method
        let params: String
    }

    struct UserConsentAction: Encodable {
        let type: Method
        let supplementaryConsents: [Aiuta.Consent]
    }

    struct UploadedImagesAction: Encodable {
        let type: Method
        let uploadedImages: [Aiuta.Image]
    }

    struct UploadedImageAction: Encodable {
        let type: Method
        let uploadedImage: Aiuta.Image
    }

    struct GeneratedImagesAction: Encodable {
        let type: Method
        let generatedImages: [Aiuta.Image]
    }
}

extension AiutaPlugin.ProductAction {
    enum Method: String, Encodable {
        case addToCartClick, addToWishlistClick
    }
}

extension AiutaPlugin.UserConsentAction {
    enum Method: String, Encodable {
        case obtainUserConsent
    }
}

extension AiutaPlugin.UploadedImagesAction {
    enum Method: String, Encodable {
        case addUploadedImages, deleteUploadedImages
    }
}

extension AiutaPlugin.UploadedImageAction {
    enum Method: String, Encodable {
        case selectUploadedImage
    }
}

extension AiutaPlugin.GeneratedImagesAction {
    enum Method: String, Encodable {
        case addGeneratedImages, deleteGeneratedImages
    }
}

extension AiutaPlugin.RequestJwtAction {
    enum Method: String, Encodable {
        case requestJwt = "requestJWT"
    }
}
