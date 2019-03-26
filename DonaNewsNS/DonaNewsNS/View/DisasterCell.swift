//
//  DisasterCell.swift
//  DonaNewsNS
//
//  Created by Sahil Reddy on 3/19/19.
//  Copyright © 2019 Sahil Reddy. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    func setupViews(){
        
    }
    override var isHighlighted: Bool{
        didSet{
            backgroundColor = isHighlighted ? UIColor.lightGray : UIColor.white
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class DisasterCell:BaseCell{
    
    var disasster: DisasterPost?{
        didSet{
            titleLabel.text = disasster?.title
            thumbnailImageView.image = UIImage(named: (disasster?.thumbnailImageName)!)
            
            if let profileImageName = disasster?.user?.profileImageName{
                userProfileImageView.image = UIImage(named: profileImageName)
                subtitleTextView.text = disasster?.user?.name
            }
            //measure title text
            if let title = disasster?.title{
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
                
                if estimatedRect.size.height > 20 {
                    titleLabelHeightConstraint?.constant = 44
                } else {
                    titleLabelHeightConstraint?.constant = 20
                }
            }
        }
        
    }
    
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wildfire")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Ann")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wildfires in California Displacing Millions of Americans"
        label.numberOfLines = 2
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor.gray
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Ann Perkins · 2 days ago"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        return textView
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView)
        
        addConstraintsWithFormat("H:|-16-[v0(44)]", views: userProfileImageView)
        
        //vertical constraints
        addConstraintsWithFormat("V:|-16-[v0]-8-[v1(44)]-28-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
        
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //height constraint
        titleLabelHeightConstraint = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44)
        addConstraint(titleLabelHeightConstraint!)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        //left constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        //height constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
    }
    
   
}

