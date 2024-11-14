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

extension AiutaPlugin.WrapperError {
    var flutterResponse: Any {
        switch self {
            case let .invalidSdkVersion(needed, persist): return FlutterError(code: "-100", message: "Obsolete native iOS SDK version \(persist) is installed, \(needed) is required",
                                                                              details: "Try run `pod update` in the `ios` directory to update the native SDK manually")
            case let .invalidConfiguration(details): return FlutterError(code: "-10", message: "Invalid configuration", details: details)
            case let .noSuchArgument(name): return FlutterError(code: "-11", message: "No such argument", details: name)
            case let .invalidArgument(name): return FlutterError(code: "-12", message: "Invalid argument value", details: name)
            case .unsupportedPlatform: return FlutterError(code: "-13", message: "The plugin only supports iOS 13+", details: nil)
            case .invalidViewState: return FlutterError(code: "-20", message: "Can't find flutter view controller", details: nil)
            case .notImplemented: return FlutterMethodNotImplemented
        }
    }
}

extension Error {
    var flutterResponse: Any {
        if let pluginError = self as? AiutaPlugin.WrapperError {
            return pluginError.flutterResponse
        } else {
            return FlutterError(code: "-1000", message: "Plugin internal error", details: String(describing: self))
        }
    }
}
