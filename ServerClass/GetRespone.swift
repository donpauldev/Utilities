//
//  GetRespone.swift
//  Azool
//
//  Created by AJESHKUMAR CHEMPANKULAM DIVAKARAN on 17/05/17.
//  Copyright © 2017 donpaulpm. All rights reserved.
//

import UIKit
import Alamofire


protocol GetResultResponse {
    
    func GetServiceRespone(param:NSDictionary)
    
}
class GetRespone: NSObject {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var delegete:GetResultResponse?
    var shared = SharedInstance.sharedData
   
    func webServiceCall(param:[String : Any],tpye:NSString) {
        
        if var mainController = UIApplication.shared.keyWindow?.rootViewController {
            
            while let presentedViewController = mainController.presentedViewController {
                
                mainController = presentedViewController
                
            }
            if isInternetAvailable(){
                
                let ulr =  NSURL(string:tpye as String)
                Alamofire.request(ulr! as URL , method: .post, parameters: param  , encoding: URLEncoding(destination: .methodDependent), headers: nil).responseJSON { (response:DataResponse<Any>) in
                    switch(response.result) {
                        
                    case .success(_):
                        
                        if let data = response.result.value{
                            
                            print(data)
                            let json = data as! NSDictionary
                            let status = json.value(forKey: "status") as! Bool
                            if status{
                                
                                self.delegete?.GetServiceRespone(param: json)
                                
                            }else{
                                
                                Utilities.AlertAction(Title: "Error", Message: json.value(forKey: "msg") as? String ?? "Error Founded")
                                
                            }
                            
                        }
                        break
                    case .failure(_):
                        
                        Utilities.AlertAction(Title: "Error", Message: response.result.error as? String ?? "Please check your Internet connection")
                        
                        break
                      
                        
                    }
                    
                }
                
            }else{
                
            Utilities.AlertAction(Title: "Error", Message: "Please add your  device in a Internet connection")
             
            }
            
        }
        
    }

}
