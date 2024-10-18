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
    struct UploadedImage: Codable {
        static let key: String = "uploadedImages"
        
        let id: String
        let url: String
    }

    struct GeneratedImage: Codable {
        static let key: String = "generatedImages"
        
        let url: String
    }
}

extension AiutaPlugin.UploadedImage {
    init(_ sdkImage: Aiuta.UploadedImage) {
        self.init(id: sdkImage.id, url: sdkImage.url)
    }
}

extension AiutaPlugin.GeneratedImage {
    init(_ sdkImage: Aiuta.GeneratedImage) {
        self.init(url: sdkImage.url)
    }
}

extension Aiuta.UploadedImage {
    init(_ pluginImage: AiutaPlugin.UploadedImage) {
        self.init(id: pluginImage.id, url: pluginImage.url)
    }
}

extension Aiuta.GeneratedImage {
    init(_ pluginImage: AiutaPlugin.GeneratedImage) {
        self.init(url: pluginImage.url)
    }
}
