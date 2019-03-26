//
//  AppDelegate.swift
//  DonaNewsNS
//
//  Created by Sahil Reddy on 3/19/19.
//  Copyright © 2019 Sahil Reddy. All rights reserved.
//

import UIKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        //let layout = UICollectionViewFlowLayout()
        //window?.rootViewController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
        window?.rootViewController = CustomTabBarController()
        
        UINavigationBar.appearance().barTintColor = UIColor.rgb(red: 0, green: 211, blue: 56)
        
        /*//application.statusBarStyle = .lightContent
        
        let statusBBV = UIView()
        UINavigationBar.appearance().barTintColor = UIColor.rgb(red: 0, green: 193, blue: 48)
        
        window?.addSubview(statusBBV)
        window?.addConstraintsWithFormat("H: |[v0]|", views: statusBBV)
        window?.addConstraintsWithFormat("V: |[v0(20)]|", views: statusBBV)
 */
        return true
    }
}
