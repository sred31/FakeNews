//
//  ViewController.swift
//  DonaNewsNS
//
//  Created by Sahil Reddy on 3/19/19.
//  Copyright © 2019 Sahil Reddy. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var disasters: [DisasterPost] = {
        
        var burtUser = User()
        burtUser.name = "Burt Macklin FBI"
        burtUser.profileImageName = "burt"
        
        var disaster1 = DisasterPost()
        disaster1.title = "Wildfires in California Displacing Millions of Americans"
        disaster1.thumbnailImageName = "disaster1"
        disaster1.user = burtUser
        
        var disaster2 = DisasterPost()
        disaster2.title = "Earthquakes in Indonesia Kill 50"
        disaster2.thumbnailImageName = "earthquake"
        disaster2.user = burtUser
        
        
        return [disaster1, disaster2]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(DisasterCell.self, forCellWithReuseIdentifier: "cellId")
        
        setupNavBarButtons()
    }
    
    func setupNavBarButtons() {
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "hamburger")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.leftBarButtonItem = moreButton
    }
    //let settingsLauncher = SettingsLauncher()
    
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    
    func showControllerForSetting(setting: Setting) {
        let dummySettingsViewController = UIViewController()
        dummySettingsViewController.view.backgroundColor = UIColor.white
        dummySettingsViewController.navigationItem.title = setting.name
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.pushViewController(dummySettingsViewController, animated: true)
    }
    
    
    @objc func handleMore(){
        //show menu
        settingsLauncher.showSettings()
        
    
        }
    
        

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return disasters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! DisasterCell
        cell.disasster = disasters[indexPath.item]
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}










