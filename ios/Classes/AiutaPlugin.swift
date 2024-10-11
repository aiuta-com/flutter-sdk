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
                test()
            default:
                result(FlutterMethodNotImplemented)
        }
    }
    
    private func test() {
        let alert = UIAlertController(title: "Hello", message: "\nfrom flutter.\n", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        currentController?.present(alert, animated: true, completion: nil)
    }
    
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
