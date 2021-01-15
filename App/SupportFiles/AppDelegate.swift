//
//  AppDelegate.swift
//  App
//
//  Created by Robson Moreira on 21/12/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: SimulatorViewController())
        navigationController.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }

}


