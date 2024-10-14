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
import Foundation

extension AiutaPlugin.Configuration {
    func buildConfiguration() -> Aiuta.Configuration {
        var configuration = Aiuta.Configuration()

        configuration.appearance.presentationStyle = mode.presentationStyle
        
        configuration.behavior.isDebugLogsEnabled = true

        return configuration
    }
}

@available(iOS 13.0.0, *)
extension AiutaPlugin.Configuration {
    func buildAuth(_ jwtProvider: AiutaJwtProvider) throws -> AiutaAuthType {
        switch authentication.mode {
            case .apiKey:
                guard let apiKey = authentication.apiKey else {
                    throw AiutaPluginError.invalidConfiguration
                }
                return .apiKey(apiKey: apiKey)
            case .jwt:
                guard let subscriptionId = authentication.subscriptionId else {
                    throw AiutaPluginError.invalidConfiguration
                }
                return .jwt(subscriptionId: subscriptionId, jwtProvider: jwtProvider)
        }
    }
}

extension AiutaPlugin.Configuration.PresentationMode {
    var presentationStyle: Aiuta.Configuration.Appearance.PresentationStyle {
        switch self {
            case .fullScreen: return .fullScreen
            case .bottomSheet: return .bottomSheet
            case .pageSheet: return .pageSheet
        }
    }
}
