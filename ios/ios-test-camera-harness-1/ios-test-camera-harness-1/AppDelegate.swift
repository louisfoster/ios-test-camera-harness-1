//
//  AppDelegate.swift
//  ios-test-camera-harness-1
//
//  Created by Louie on 10/3/18.
//  Copyright © 2018 Louis Foster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var mainViewController: MainViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.mainViewController = MainViewController()
        
        self.window?.rootViewController = self.mainViewController
        
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
