//
//  AppDelegate.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 06/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    private let appCoordinator = AppCoordinator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = appCoordinator.rootViewController
        
        window?.makeKeyAndVisible()
        
        // Start main coordinator
        appCoordinator.start()
        
        return true
    
    }


}

