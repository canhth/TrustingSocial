//
//  AppDelegate.swift
//  TrustingSocial
//
//  Created by Canh Tran on 9/7/18.
//  Copyright © 2018 Canh Tran. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let appCoordinator = TrustingSocialCoordinator(window: window!)
        appCoordinator.startToLoadView()
        window?.makeKeyAndVisible()
        
        setupUIAppearance()
        
        return true
    }
  
    private func setupUIAppearance() {
        // Navigation bar
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.barStyle = .black
        navigationBarAppearace.tintColor = UIColor(hex: "ffffff")
        navigationBarAppearace.barTintColor = UIColor.black.withAlphaComponent(0.8)
        navigationBarAppearace.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
}

