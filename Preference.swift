//
//  Preference.swift
//  Preference Swift
//
//  Created by Don Paul on 06/03/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation
import UIKit

public class Preference
{
    
    /*-----------------------------------------------------------------------*/
    
    // MARK: - SPLASH_USER for Showed[True] or not[False]
    class func SET_oneTimeSplash(user_status:Bool){
        UserDefaults.standard.set(true, forKey: "SPLASH_USER")
        UserDefaults.standard.synchronize()
    }
    class func GET_oneTimeSplash() -> Bool{
        var user_splash:Bool = false
        if (UserDefaults.standard.value(forKey: "SPLASH_USER") != nil){
            user_splash = UserDefaults.standard.value(forKey: "SPLASH_USER") as! Bool
        }
        return user_splash
    }
    
    
    /*-----------------------------------------------------------------------*/
    
    // MARK: - USERSTATUS for login[True] or not[False]
    class func SET_uStatus(user_status:Bool){
        UserDefaults.standard.set(true, forKey: "USER_STATUS")
        UserDefaults.standard.synchronize()
    }
    class func GET_uStatus() -> Bool{
        
        var user_status = Bool()
        
        if (UserDefaults.standard.value(forKey: "USER_STATUS") != nil){
            user_status = UserDefaults.standard.value(forKey: "USER_STATUS") as! Bool
        }
        return user_status
    }
    
    /*-----------------------------------------------------------------------*/
    
    // MARK: - For login tost
    class func SET_utost(user_tost:Bool){
        UserDefaults.standard.set(user_tost, forKey: "USER_TOST")
        UserDefaults.standard.synchronize()
    }
    class func GET_utost() -> Bool{
        
        var user_tost = Bool()
        
        if (UserDefaults.standard.value(forKey: "USER_TOST") != nil){
            user_tost = UserDefaults.standard.value(forKey: "USER_TOST") as! Bool
        }
        return user_tost
    }
    
    /*-----------------------------------------------------------------------*/
    // MARK: - USERTYPE for admin[True] or user[False]
    class func SET_uTYPE(user_type:Bool){
        UserDefaults.standard.set(true, forKey: "USER_TYPE")
        UserDefaults.standard.synchronize()
    }
    class func GET_uTYPE() -> Bool{
        let user_type = UserDefaults.standard.value(forKey: "USER_TYPE") as! Bool
        return user_type
    }
    
    /*----------------------------------------------------------------------*/
    // MARK: - USERID
    class func SET_USERID(user_id:String){
        UserDefaults.standard.setValue(user_id, forKeyPath: "USER_ID")
        UserDefaults.standard.synchronize()
    }
    class func GET_USERID() -> String{
        var user_id  = String()
        if (UserDefaults.standard.value(forKey: "USER_ID") != nil){
            user_id = UserDefaults.standard.value(forKey: "USER_ID") as! String
        }
        return user_id
    }


    /*-----------------------------------------------------------------------*/
    // MARK: - USERTYPE for admin[True] or user[False]
    class func SET_uIMAGE(user_image:String){
        
        UserDefaults.standard.setValue(user_image, forKey: "USER_IMAGE")
        UserDefaults.standard.synchronize()
    }
    class func GET_uIMAGE() -> String{
        var user_image = String()
        if  (UserDefaults.standard.value(forKey: "USER_IMAGE") != nil){
            user_image = UserDefaults.standard.value(forKey: "USER_IMAGE") as! String
        }
        return user_image
    }


    /*-----------------------------------------------------------------------*/

// MARK: - USERNAME
    class func SET_USERNAME(user_name:String){
        UserDefaults.standard.setValue(user_name, forKeyPath: "USER_NAME")
        UserDefaults.standard.synchronize()
    }
    class func GET_USERNAME() -> String{
        let user_name = UserDefaults.standard.value(forKey: "USER_NAME") as! String
        return user_name
    }
    
    /*-----------------------------------------------------------------------*/
// MARK: - USEREMAIL
    class func SET_USEREMAIL(user_email:String){
        UserDefaults.standard.setValue(user_email, forKeyPath: "USER_EMAIL")
        UserDefaults.standard.synchronize()
    }
    class func GET_USEREMAIL() -> String{
        let user_email = UserDefaults.standard.value(forKey: "USER_EMAIL") as! String
        return user_email
    }
    
    /*-----------------------------------------------------------------------*/
// MARK: - USERPHONE
    class func SET_uPhone(user_phone:String){
        UserDefaults.standard.setValue(user_phone, forKeyPath: "USER_PHONE")
        UserDefaults.standard.synchronize()
    }
    class func GET_uPhone() -> String{
        let user_phone = UserDefaults.standard.value(forKey: "USER_PHONE") as! String
        return user_phone
    }
    
    /*-----------------------------------------------------------------------*/
    
    
     

}
