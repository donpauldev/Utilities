//
//  PostRespone.swift
//  Azool
//
//  Created by AJESHKUMAR CHEMPANKULAM DIVAKARAN on 17/05/17.
//  Copyright © 2017 donpaulpm. All rights reserved.
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
