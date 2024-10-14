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
import UIKit

public class AiutaPlugin: NSObject, FlutterPlugin {
    public static let channelName = "aiutasdk"

    public static func register(with registrar: FlutterPluginRegistrar) {
        registrar.addMethodCallDelegate(AiutaPlugin(), channel: FlutterMethodChannel(
            name: AiutaPlugin.channelName,
            binaryMessenger: registrar.messenger()
        ))
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        do {
            try handlers.handle(call)
        } catch {
            result(error.flutterResponse)
        }
    }

    private let handlers: [AiutaHandler] = [
        StartAiutaFlowHandler(),
    ]
}
