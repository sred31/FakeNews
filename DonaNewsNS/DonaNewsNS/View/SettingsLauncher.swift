//
//  SettingsLauncher.swift
//  DonaNewsNS
//
//  Created by Sahil Reddy on 3/21/19.
//  Copyright © 2019 Sahil Reddy. All rights reserved.
//

import UIKit

class Setting: NSObject{
    let name: String
    let imageName: String
    
    init(name: String, imageName: String){
        self.name = name
        self.imageName = imageName
        
    }
}

class SettingsLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var homeController: HomeController?
    
    let blackView = UIView()
    
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    let cellId = "cellId"
    
    let settings: [Setting] = {
        return [Setting(name: "Profile", imageName: "profile"), Setting(name: "Help", imageName: "help"),Setting(name: "Donation Progress", imageName: "trending"), Setting(name: "Settings", imageName: "settings") ]
    }()
    
    func showSettings() {
        //show menu
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            
            window.addSubview(collectionView)
            
            let width: CGFloat = 250
            //let y = window.frame.height - height
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: width, height: window.frame.height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.blackView.alpha = 1
                
                self.collectionView.frame = CGRect(x: 0, y: 90, width: 250, height: self.collectionView.frame.height)
                
            }, completion: nil)
        }
    }
    
    @objc func handleDismiss(setting: Setting) {
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
        }, completion: { (_) in
            if setting.name != "" && setting.name != "Cancel" {
                self.homeController?.showControllerForSetting(setting: setting)
            }
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SettingsCell
        
        let setting = settings[indexPath.item]
        cell.setting = setting
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  /*      let setting = settings[indexPath.item]
        print(setting.name)
        
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
        }
        */
        let setting = self.settings[indexPath.item]
        handleDismiss(setting: setting)
    }
    
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(SettingsCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
}
