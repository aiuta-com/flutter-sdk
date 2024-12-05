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

public class AiutaPlugin: NSObject, FlutterPlugin {
    let methodChannelName = "aiutasdk"
    let compatibleSdkVersion = "3.3.10"
    let channel: FlutterMethodChannel
    let basket: AiutaBasket
    let host: AiutaHost
    let handlers: [AiutaCallHandler]
    let streamers: [AiutaStreamHandler]

    init(with messenger: FlutterBinaryMessenger) {
        channel = FlutterMethodChannel(
            name: methodChannelName,
            binaryMessenger: messenger
        )

        basket = AiutaBasketImpl()

        streamers = [
            AiutaActionsStreamerImpl(with: messenger, basket: basket),
            AiutaDataActionsStreamerImpl(with: messenger),
            AiutaAnalyticsStreamerImpl(with: messenger),
            AiutaJwtStreamerImpl(with: messenger),
        ]

        host = AiutaHostImpl(with: streamers)

        handlers = [
            TestAvailabilityHandlerImpl(with: compatibleSdkVersion),
            ConfigureHandlerImpl(with: host),
            StartAiutaFlowHandlerImpl(with: host, basket: basket),
            StartHistoryFlowHandlerImpl(with: host),
            ResolveJwtAuthHandlerImpl(with: host),
            ErrorHandlerImpl(with: host),
            UpdateUserConsentHandlerImpl(with: host.dataProvider),
            UpdateUploadedImagesHandlerImpl(with: host.dataProvider),
            UpdateGeneratedImagesHandlerImpl(with: host.dataProvider),
            UpdateActiveAiutaProductHandlerImpl(with: host.dataProvider, basket: basket),
        ]
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        do {
            result(try handlers.handle(call))
        } catch {
            result(error.flutterResponse)
        }
    }

    public func detachFromEngine(for registrar: FlutterPluginRegistrar) {
        streamers.forEach { $0.onDetach() }
        channel.setMethodCallHandler(nil)
    }
}

extension AiutaPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let plugin = AiutaPlugin(with: registrar.messenger())
        registrar.addMethodCallDelegate(plugin, channel: plugin.channel)
    }
}
