//
//  settingsCell.swift
//  DonaNewsNS
//
//  Created by Sahil Reddy on 3/21/19.
//  Copyright © 2019 Sahil Reddy. All rights reserved.
//

import UIKit

class SettingsCell: BaseCell{
    
    override var isHighlighted: Bool{
        didSet{
            backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.white
            
            nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
            
            iconImage.tintColor = isHighlighted ? UIColor.white : UIColor.darkGray
        }
    }
    
    var setting: Setting? {
        didSet{
            nameLabel.text = setting?.name
            if let imageName = setting?.imageName{
                iconImage.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
                iconImage.tintColor = UIColor.darkGray
            }
            
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        return label
    }()
    
    let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "settings")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(nameLabel)
        addSubview(iconImage)
        
        addConstraintsWithFormat("H:|-8-[v0(30)]-8-[v1]|", views: iconImage, nameLabel)
        addConstraintsWithFormat("V:|[v0]|", views: nameLabel)
        addConstraintsWithFormat("V:|-8-[v0(30)]", views: iconImage)
        
        addConstraint(NSLayoutConstraint(item: iconImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
}
