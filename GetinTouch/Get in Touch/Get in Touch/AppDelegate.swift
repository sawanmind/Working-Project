//
//  AppDelegate.swift
//  Get in Touch
//
//  Created by Sawkan Team on 16/06/17.
//  Copyright © 2017 Sawkan Team. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = TabBarVC()
        setupnavigation_tabbar_apperance()
        return true
    }

  
    
    
    func setupnavigation_tabbar_apperance(){
        
        
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor.black
        navigationBarAppearace.barTintColor = UIColor.white
        
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.black,NSKernAttributeName : 1.4]
        navigationBarAppearace.shadowImage = UIImage()
        
        UITabBar.appearance().tintColor = UIColor.black
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().isTranslucent = false
        
    }
}

