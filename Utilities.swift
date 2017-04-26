//
//  Utilities.swift
//  Utilities Swift
//
//  Created by Don Paul on 06/03/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation
import UIKit
import PCLBlurEffectAlert
struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS =  UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
}

public class Utilities
{
    

    /*-----------------------------------------------------------------------*/
    
    // MARK: - Alert Colors
    
    
    class func alertBGColor() -> UInt{
        let color = 0xFFFFFF 
        return UInt(color)
    }
    
    class func alertColor() -> UInt{
        let color = 0xEE3744 
        return UInt(color)
    }
    
    class func BGColour() ->UIColor {
        let color = UIColor(red:228/255, green: 32/255, blue: 1/255, alpha: 1.0)
        return color
    }
    
    class func FGColour() ->UIColor {
        let color = UIColor(red:254/255, green: 245/255, blue: 246/255, alpha: 1)
        return color
    }

    
    
    
    /*-----------------------------------------------------------------------*/
    
    
    // MARK: - Alert.
    
    class func AlertAction(Title:String,Message:String) {
        
        let alertController = PCLBlurEffectAlertController(title: Title, message: Message, effect: UIBlurEffect(style: .light ), style: .alert)
        alertController.configure(titleColor: UIColor.black)
        alertController.configure(messageColor: UIColor.black)
        alertController.configure(cornerRadius: 10)
        let cancelAction = PCLBlurEffectAlertAction(title: "OK", style: .cancel) { _ in }
        alertController.addAction(cancelAction)
        alertController.show()
        
    }
    
    
    /*-----------------------------------------------------------------------*/
    
    // MARK: - VALIDATION
    
    class func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    class func isValidPhone(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    /*-----------------------------------------------------------------------*/
    
    // MARK: - Mortion Effect
    
    class func mortioeffect(toView view:UIView, mag:Float) {
        let xMortion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xMortion.minimumRelativeValue = -mag
        xMortion.maximumRelativeValue = mag
        
        let yMortion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yMortion.minimumRelativeValue = -mag
        yMortion.maximumRelativeValue = mag
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [xMortion, yMortion]
        view.addMotionEffect(group)
    }

    

}
