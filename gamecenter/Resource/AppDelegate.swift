//
//  AppDelegate.swift
//  gamecenter
//
//  Created by daovu on 9/29/20.
//  Copyright © 2020 daovu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        NetworkManager.shared = NetworkManager()
        NetworkManager.shared.start()
        
        if #available(iOS 13.0, *) {
            // do something
        } else {
            window = UIWindow()
            window!.rootViewController = UIViewController()
            window!.makeKeyAndVisible()
            let sceneCoordinator = SceneCoordinator(window: window!)
            SceneCoordinator.shared = sceneCoordinator
            LocalDB.shared = LocalDB()
            
            if LocalDB.shared.isFirstLaunch() {
                sceneCoordinator.transition(to: Scene.splash(SplashViewModel()))
            } else {
                sceneCoordinator.transition(to: Scene.top)
            }
        }
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
