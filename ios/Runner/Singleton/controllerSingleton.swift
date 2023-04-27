//
//  controllerSingleton.swift
//  Runner
//
//  Created by Gabriel Aderaldo on 25/04/23.
//

import Foundation


class ControllerSingleton{
    var controller:FlutterViewController?
    static let shared = ControllerSingleton()
    
    private init(){}
    
    func setController(controller:FlutterViewController){
        self.controller = controller
    }
    
    func getController()->FlutterViewController{
        guard let controller = self.controller else{
            return FlutterViewController.init()
        }
        return controller
    }
}
