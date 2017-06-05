//
//  UIView+Properties.swift
//  Azool
//
//  Created by DON PAUL PM on 15/05/17.
//  Copyright © 2017 donpaulpm. All rights reserved.
//

import UIKit

@IBDesignable extension UIView {
    
    @IBInspectable  var cornerRadius: CGFloat {
        
       set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
   @IBInspectable  var borderColor: UIColor {
    
        set {
            layer.borderColor = newValue.cgColor
           
        }
        get {
            if let color   =        layer.borderColor {
               return  UIColor(cgColor: color)
            }
            return UIColor(cgColor: UIColor.white as! CGColor)
        }
    }
    
   @IBInspectable  var borderwidth: CGFloat {
    
        set {
            layer.borderWidth = newValue
            
        }
        get {
            return layer.borderWidth
        }
    }
}
extension UITextField   {
    
    @IBInspectable  var placeHolderColor: UIColor? {
        
    set {
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! :  "", attributes:[NSForegroundColorAttributeName:newValue!])
    }
    get {
        return self.placeHolderColor
    }
    
 }
    
}
