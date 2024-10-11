@_spi(Aiuta) import AiutaKit
import AiutaSdk
import Flutter
import UIKit

public class AiutaPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "aiutasdk", binaryMessenger: registrar.messenger())
        let instance = AiutaPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
            case "startAiutaFlow":
                startAiutaFlow()
            default:
                result(FlutterMethodNotImplemented)
        }
    }

    private func startAiutaFlow() {
        if #available(iOS 13.0.0, *), let currentController {
            Aiuta.setup(apiKey: "", configuration: nil)
            Aiuta.tryOn(
                sku: .init(
                    skuId: "",
                    skuCatalog: "",
                    imageUrls: [],
                    localizedTitle: "",
                    localizedBrand: ""
                ),
                in: currentController,
                delegate: self
            )
        }
    }
}

extension AiutaPlugin: AiutaSdkDelegate {
    public func aiuta(addToWishlist skuId: String) { }

    public func aiuta(addToCart skuId: String) {}

    public func aiuta(showSku skuId: String) {}

    public func aiuta(eventOccurred event: Aiuta.SdkEvent) {}
}

private extension AiutaPlugin {
    var currentController: UIViewController? {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
}
