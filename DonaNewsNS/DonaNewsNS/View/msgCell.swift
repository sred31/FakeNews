//
//  msgCell.swift
//  DonaNewsNS
//
//  Created by Sahil Reddy on 3/20/19.
//  Copyright © 2019 Sahil Reddy. All rights reserved.
//



import UIKit

class msgCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    override var isHighlighted: Bool{
        didSet{
            backgroundColor = isHighlighted ? UIColor.lightGray : UIColor.white
        }
    }
  
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BardosTroll")
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
        label.text = "Hey! Thank you for donating!"
        label.textColor = UIColor.black
        return label
    }()
    let whoLabel: UILabel = {
        let label = UILabel()
        label.text = "Michael Bardos"
        label.textColor = UIColor.black
        return label
    }()
    
    
    
    let msgTextView: UIView = {
        let textView = UIView()
        //textView.textColor = UIColor.gray
        textView.backgroundColor = UIColor.blue
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "8:05 pm"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    func setupViews() {
        
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(msgTextView)
        
        setupContainerView()
        
        userProfileImageView.image = UIImage(named: "BardosTroll")
        
        addConstraintsWithFormat("H:|-12-[v0(68)]", views: userProfileImageView)
        addConstraintsWithFormat("V:[v0(68)]", views: userProfileImageView)
        
        addConstraint(NSLayoutConstraint(item: userProfileImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
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
        containerView.addSubview(timeLabel)
        
        containerView.addConstraintsWithFormat("H:|[v0][v1(80)]|", views: whoLabel, timeLabel)
        containerView.addConstraintsWithFormat("V:|[v0][v1(24)]|", views: whoLabel, msgLabel)
        containerView.addConstraintsWithFormat("H:|[v0]-12-|", views: msgLabel)
        containerView.addConstraintsWithFormat("V:|[v0(20)]", views: timeLabel)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



