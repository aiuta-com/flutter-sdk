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

import Foundation

extension AiutaPlugin {
    struct Configuration: Decodable {
        static let key: String = "configuration"

        let mode: PresentationMode
        let authentication: Authentication
    }
}

extension AiutaPlugin.Configuration {
    enum PresentationMode: String, Decodable {
        case fullScreen, bottomSheet, pageSheet
    }
}

extension AiutaPlugin.Configuration {
    struct Authentication: Decodable {
        enum Method: String, Decodable {
            case apiKey, jwt
        }

        let mode: Method
        let subscriptionId: String?
        let apiKey: String?
    }
}
