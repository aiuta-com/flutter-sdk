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
import Foundation

class AiutaStreamHandlerImpl: NSObject, FlutterStreamHandler, AiutaStreamHandler {
    private let channel: FlutterEventChannel
    private var eventSink: FlutterEventSink?
    private let encoder = JSONEncoder()

    init(with messenger: FlutterBinaryMessenger, name: String) {
        channel = FlutterEventChannel(name: name, binaryMessenger: messenger)
        super.init()
        channel.setStreamHandler(self)
    }

    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }

    func send<T>(_ event: T) where T: Encodable {
        guard let eventSink,
              let data = try? encoder.encode(event),
              let event = String(data: data, encoding: .utf8) else { return }
        eventSink(event)
    }

    func onDetach() {
        channel.setStreamHandler(nil)
        eventSink = nil
    }
}
