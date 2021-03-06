//
//  AppDelegate.swift
//  BookCaseApp
//
//  Created by Kirill Khudiakov on 28.04.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        configureWindow()
        return true
    }
    
    fileprivate func configureWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: BookListViewController(model: "OK"))
        
    }

}

