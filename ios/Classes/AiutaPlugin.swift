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
    private let channel: FlutterMethodChannel
    private let basket: AiutaBasket
    private let host: AiutaHost
    private let handlers: [AiutaCallHandler]
    private let streamers: [AiutaStreamHandler]

    init(with messenger: FlutterBinaryMessenger) {
        channel = FlutterMethodChannel(
            name: "aiutasdk",
            binaryMessenger: messenger
        )

        basket = AiutaBasketImpl()

        streamers = [
            AiutaActionsStreamerImpl(with: messenger, basket: basket),
            AiutaJwtStreamerImpl(with: messenger),
        ]

        host = AiutaHostImpl(with: streamers)

        handlers = [
            StartAiutaFlowHandlerImpl(with: host, basket: basket),
            ResolveJwtAuthHandlerImpl(with: host),
        ]
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        do {
            try handlers.handle(call)
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
