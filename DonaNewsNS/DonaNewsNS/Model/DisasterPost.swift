//
//  DisasterPost.swift
//  DonaNewsNS
//
//  Created by Sahil Reddy on 3/21/19.
//  Copyright © 2019 Sahil Reddy. All rights reserved.
//

import UIKit

class DisasterPost:NSObject{
    var thumbnailImageName: String?
    var title: String?
    
    var user: User?
}
class User:NSObject{
    var name: String?
    var profileImageName: String?
}
