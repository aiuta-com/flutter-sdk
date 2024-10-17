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

import Flutter

final class AiutaDataActionsStreamerImpl: AiutaStreamHandlerImpl, AiutaDataActionsStreamer {
    init(with messenger: FlutterBinaryMessenger) {
        super.init(with: messenger, name: "aiutaDataActionsHandler")
    }

    func obtainUserConsent() {
        send(AiutaPlugin.UserConsentAction(type: .obtainUserConsent))
    }

    func addUploadedImages(_ images: [AiutaPlugin.UploadedImage]) {
        send(AiutaPlugin.UploadedImagesAction(type: .addUploadedImages, uploadedImages: images))
    }

    func deleteUploadedImages(_ images: [AiutaPlugin.UploadedImage]) {
        send(AiutaPlugin.UploadedImagesAction(type: .deleteUploadedImages, uploadedImages: images))
    }

    func selectUploadedImage(_ image: AiutaPlugin.UploadedImage) {
        send(AiutaPlugin.UploadedImageAction(type: .selectUploadedImage, uploadedImage: image))
    }

    func addGeneratedImages(_ images: [AiutaPlugin.GeneratedImage]) {
        send(AiutaPlugin.GeneratedImagesAction(type: .addGeneratedImages, generatedImages: images))
    }

    func deleteGeneratedImages(_ images: [AiutaPlugin.GeneratedImage]) {
        send(AiutaPlugin.GeneratedImagesAction(type: .deleteGeneratedImages, generatedImages: images))
    }
}
