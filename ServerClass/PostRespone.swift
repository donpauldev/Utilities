//
//  PostRespone.swift
//  PostRespone Swift
//
//  Created by Don Paul on 06/03/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit
import Alamofire


protocol PostResultResponse {
    
    func PostServiceRespone(param:NSDictionary)
    
}

class PostRespone: NSObject {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var delegete:GetResultResponse?
    var shared = SharedInstance.sharedData
    
}
