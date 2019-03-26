//
//  NotificationsCell.swift
//  DonaNewsNS
//
//  Created by Sahil Reddy on 3/20/19.
//  Copyright © 2019 Sahil Reddy. All rights reserved.
//

import UIKit

class NotificationsCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    override var isHighlighted: Bool{
        didSet{
            backgroundColor = isHighlighted ? UIColor.lightGray : UIColor.white
        }
    }
    
    
    let notificationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 34
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    let msgLabel: UILabel = {
        let label = UILabel()
        label.text = "Message of the notification alert blah blah blah blah"
        label.textColor = UIColor.black
        return label
    }()
    let whoLabel: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.textColor = UIColor.black
        return label
    }()
    
    
    
    let notificationTextView: UIView = {
        let textView = UIView()
        //textView.textColor = UIColor.gray
        textView.backgroundColor = UIColor.blue
        textView.translatesAutoresizingMaskIntoConstraints = false
        //textView.text = "Ann Perkins · 2 days ago"
        //textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        return textView
    }()
    
    func setupViews() {
        
        addSubview(separatorView)
        addSubview(notificationImageView)
        addSubview(notificationTextView)
        
        setupContainerView()
        
        notificationImageView.image = UIImage(named: "tsunami")
        
        addConstraintsWithFormat("H:|-12-[v0(68)]", views: notificationImageView)
        addConstraintsWithFormat("V:[v0(68)]", views: notificationImageView)
        
        addConstraint(NSLayoutConstraint(item: notificationImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        //vertical constraints
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        addConstraintsWithFormat("V:[v0(1)]|", views: separatorView)
        
        
        
       
        
    }
    private func setupContainerView(){
        let containerView = UIView()
        addSubview(containerView)
        
        addConstraintsWithFormat("H:|-90-[v0]|", views: containerView)
        addConstraintsWithFormat("V:[v0(50)]", views: containerView)
        addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        containerView.addSubview(msgLabel)
        containerView.addSubview(whoLabel)
        
        containerView.addConstraintsWithFormat("H:|[v0]|", views: whoLabel)
        containerView.addConstraintsWithFormat("V:|[v0][v1(24)]|", views: whoLabel, msgLabel)
        containerView.addConstraintsWithFormat("H:|[v0]|", views: msgLabel)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


