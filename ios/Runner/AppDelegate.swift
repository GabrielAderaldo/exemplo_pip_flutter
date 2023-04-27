import UIKit
import Flutter
import AVKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      
      
      
      
      
      let flutterViewController: FlutterViewController = window?.rootViewController as! FlutterViewController
      
      ControllerSingleton.shared.setController(controller: flutterViewController)
      
      let audio = AVAudioSession.sharedInstance()
      do{
          try audio.setCategory(.playback, mode: .moviePlayback)
      }catch{
          print("Failed to set audioSession category to playback")
      }
      
      if let teste = registrar(forPlugin: "ios-pip") {
          FLPlugin.register(with: teste)
      }
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}


class FLPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let factory = FLNativeViewFactory(messenger: registrar.messenger())
        registrar.register(factory, withId: "ios-pip")
    }
}
