//
//  SearchController.swift
//  DonaNewsNS
//
//  Created by Sahil Reddy on 3/20/19.
//  Copyright © 2019 Sahil Reddy. All rights reserved.
//

import UIKit

class SearchController: UICollectionViewController, UISearchBarDelegate,  UICollectionViewDelegateFlowLayout{
    
    private var mySearchBar: UISearchBar!
    private var myLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // make UISearchBar instance
        mySearchBar = UISearchBar()
        mySearchBar.delegate = self
        mySearchBar.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 300, height: 80))
        mySearchBar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 100)
        
        // add shadow
        mySearchBar.layer.shadowColor = (UIColor.black as! CGColor)
        mySearchBar.layer.shadowOpacity = 0.5
        mySearchBar.layer.masksToBounds = false
        
        // hide cancel button
        mySearchBar.showsCancelButton = true
        
        // hide bookmark button
        mySearchBar.showsBookmarkButton = false
        
        // set Default bar status.
        mySearchBar.searchBarStyle = UISearchBar.Style.default
        
        // set title
        mySearchBar.prompt = "Title"
        
        // set placeholder
        mySearchBar.placeholder = "Input text"
        
        // change the color of cursol and cancel button.
        mySearchBar.tintColor = UIColor.red
        
        // hide the search result.
        mySearchBar.showsSearchResultsButton = false
        
        // add searchBar to the view.
        self.view.addSubview(mySearchBar)
        
        // make UITextField
        myLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 200, height: 30)))
        myLabel.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        myLabel.text = ""
        myLabel.layer.borderWidth = 1.0
        myLabel.layer.borderColor = (UIColor.gray as! CGColor)
        myLabel.layer.cornerRadius = 10.0
        
        // add the label to the view.
        self.view.addSubview(myLabel)
        self.navigationController?.navigationBar.addSubview(myLabel)
    }
    
    // called whenever text is changed.
    private func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        myLabel.text = searchText
    }
    
    // called when cancel button is clicked
    private func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        myLabel.text = ""
        mySearchBar.text = ""
    }
    
    // called when search button is clicked
    private func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        myLabel.text = "Searching"
        mySearchBar.text = ""
        self.view.endEditing(true)
    }
}
