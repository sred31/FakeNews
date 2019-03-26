//
// NotController.swift
//  DonaNewsNS
//
//  Created by Sahil Reddy on 3/19/19.
//  Copyright © 2019 Sahil Reddy. All rights reserved.
//

import UIKit

class NotController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Notifications"
        navigationController?.navigationBar.isTranslucent = false
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(NotificationsCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let height = (view.frame.width - 16 - 16) * 2 / 16
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}










