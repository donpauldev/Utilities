//
//  Utilities.swift
//  Utilities Swift
//
//  Created by Don Paul on 06/03/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit
import Alamofire
import PCLBlurEffectAlert


protocol GetResultResponse {
    
    func GetServiceRespone(param:NSDictionary)
    
}
class GetRespone: NSObject {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var delegete:GetResultResponse?
    var shared = SharedInstance.sharedData
    var retryCount:Int = 5
   
    func webServiceCall(param:[String : Any],tpye:NSString) {
        
        if var mainController = UIApplication.shared.keyWindow?.rootViewController {
            
            while let presentedViewController = mainController.presentedViewController {
                
                mainController = presentedViewController
                
            }
            
            if isInternetAvailable(){
                
                let ulr =  NSURL(string:tpye as String)
                
                print("\nurl\(String(describing: ulr))\n\(param)")
                
                Alamofire.request(ulr! as URL , method: .post, parameters: param  , encoding: URLEncoding(destination: .methodDependent), headers: nil).responseJSON { (response:DataResponse<Any>) in
                    switch(response.result) {
                        
                    case .success(_):
                        
                        if let data = response.result.value{
                            
                            print(data)
                            let json = data as! NSDictionary
                            let status = json.value(forKey: "status") as! NSString
                            if (status == "0"){
                                
                                self.delegete?.GetServiceRespone(param: json)
                                
                            }else{
                                
                                self.delegete?.GetServiceRespone(param: json)
                                
                            }
                            
                        }
                        break
                    case .failure(_):
                        if self.retryCount == 0 {
                            self.retryCount = 5
                            Utilities.AlertAction(Title: "Sorry", Message: "Maximum tries over Please Check your internet Connection or contact Customer care.")
                            
                        }else {
                        
                            var retryStr = String()
                            if self.retryCount == 5 {
                                retryStr = "Retry"
                            }else{
                                retryStr = "Retry (\(self.retryCount))"
                            }
                        let alertController = PCLBlurEffectAlertController(title: "Error", message: response.result.error as? String ?? "Sorry please try after sometime", effect: UIBlurEffect(style: .light ), style: .alert)
                        alertController.configure(titleColor: UIColor.black)
                        alertController.configure(messageColor: UIColor.black)
                        alertController.configure(cornerRadius: 10)
                        let retry = PCLBlurEffectAlertAction(title: retryStr, style: .cancel) { _ in
                            self.retryCount = self.retryCount-1
                            self.webServiceCall(param: param, tpye: tpye)
                            
                        }
                        
                        alertController.addAction(retry)
                        alertController.show()
                        }
                        break
                        
                        
                    }
                    
                }
                
            }else{
                let alertController = PCLBlurEffectAlertController(title: "Sorry", message: "Please check your Internet connection", effect: UIBlurEffect(style: .light ), style: .alert)
                alertController.configure(titleColor: UIColor.black)
                alertController.configure(messageColor: UIColor.black)
                alertController.configure(cornerRadius: 10)
                let retry = PCLBlurEffectAlertAction(title: "Retry", style: .cancel) { _ in
                    
                    self.webServiceCall(param: param, tpye: tpye)
                    
                }
                alertController.addAction(retry)
                alertController.show()
            }
            
        }
        
    }
    


}
