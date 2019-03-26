//
//  CustomTabBarController.swift
//  DonaNewsNS
//
//  Created by Sahil Reddy on 3/19/19.
//  Copyright © 2019 Sahil Reddy. All rights reserved.
//

import UIKit

class CustomTabBarController:UITabBarController{
    override func viewDidLoad(){
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        let disasterCont = HomeController(collectionViewLayout: layout)
        let homeCont = UINavigationController(rootViewController: disasterCont)
        homeCont.tabBarItem.title = "Home"
        homeCont.tabBarItem.image = UIImage(named: "home")
        
       
        let layout1 = UICollectionViewFlowLayout()
        let notifCont = NotController(collectionViewLayout: layout1)
        let thirdCont = UINavigationController(rootViewController: notifCont)
        thirdCont.tabBarItem.title = "Notifications"
        thirdCont.tabBarItem.image = UIImage(named: "notifications1")
        
        let layout2 = UICollectionViewFlowLayout()
        let msgCont = MsgController(collectionViewLayout: layout2)
        let fourthCont = UINavigationController(rootViewController: msgCont)
        fourthCont.tabBarItem.title = "Messages"
        fourthCont.tabBarItem.image = UIImage(named: "messages")
        
        
        let searchCont = UICollectionViewFlowLayout()
        let secondCont = SearchController(collectionViewLayout: searchCont)
        secondCont.tabBarItem.title = "Search"
        secondCont.tabBarItem.image = UIImage(named: "search")
        
        
        viewControllers = [homeCont, tabBarTitleCont(title: "Search", imageName: "search"), thirdCont, fourthCont]
        
        
    }
    
    private func tabBarTitleCont(title: String, imageName: String) -> UINavigationController{
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
    
    
        
    
}
