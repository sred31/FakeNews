//
//  MsgController.swift
//  DonaNewsNS
//
//  Created by Sahil Reddy on 3/20/19.
//  Copyright © 2019 Sahil Reddy. All rights reserved.
//

import UIKit

class MsgController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.isTranslucent = false
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(msgCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       // let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

