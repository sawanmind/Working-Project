//
//  ViewController.swift
//  Get in Touch
//
//  Created by Sawkan Team on 16/06/17.
//  Copyright © 2017 Sawkan Team. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let highlight = Highlights()
        let navigationController = UINavigationController(rootViewController: highlight)
        navigationController.tabBarItem.image = UIImage(named: "home")
        navigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let bookmark = Bookmark()
        let secondNavigationController = UINavigationController(rootViewController: bookmark)
        secondNavigationController.tabBarItem.image = UIImage(named: "bookmark")
        secondNavigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let sources = Sources()
        let thirdNavigationController = UINavigationController(rootViewController: sources)
        thirdNavigationController.tabBarItem.image = UIImage(named: "sources")
        thirdNavigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let activity = Activity()
        let fourthNavigationController = UINavigationController(rootViewController: activity)
        fourthNavigationController.tabBarItem.image = UIImage(named: "activity")
        fourthNavigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let profile = Profile()
        let fifthNavigationController = UINavigationController(rootViewController: profile)
        fifthNavigationController.tabBarItem.image = UIImage(named: "profile")
        fifthNavigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        
        viewControllers = [navigationController,secondNavigationController,thirdNavigationController,fourthNavigationController,fifthNavigationController]
    }


}

