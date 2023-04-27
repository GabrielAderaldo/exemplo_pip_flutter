//
//  PipView.swift
//  Runner
//
//  Created by Gabriel Aderaldo on 24/04/23.
//

import Foundation
import Flutter
import UIKit
import AVKit


class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        // iOS views can be created here
        createNativeView(view: _view)
    }

    func view() -> UIView {
        return _view
    }
    
    func setupButton() -> UIButton{
        let nativeLabel = UIButton()
        nativeLabel.setTitle("teste", for: .normal)
        nativeLabel.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        nativeLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 48.0)
        return nativeLabel
    }
    
    func createlabel() -> UILabel{
        let label = UILabel()
        label.text = "nova view"
        label.frame = CGRect(x: 50, y: 50, width: 200, height: 50)
        return label
    }
    
    func createNativeView(view _view: UIView){
        _view.backgroundColor = UIColor.blue
        
        let nativeLabel = setupButton()
        _view.addSubview(nativeLabel)
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        guard let videoUrl = Bundle.main.url(forResource: "video", withExtension: "mp4") else { return }
        let avPlayer = AVPlayer(url: videoUrl)
        let avPlayerController = AVPlayerViewController()
        avPlayerController.player = avPlayer
        let controller = ControllerSingleton.shared.getController()
        controller.present(avPlayerController, animated: true)
      
    }
}
