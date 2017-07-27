//
//  ViewControllerX.swift
//  ViewBoilerPlate
//
//  Created by DonPaulPM on 27/07/17.
//  Copyright © 2017 DonPaulPM. All rights reserved.
//

import UIKit

@IBDesignable
class UIViewControllerX: UIViewController {
    
    @IBInspectable var lightStatusBar: Bool = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            if lightStatusBar {
                return UIStatusBarStyle.lightContent
            } else {
                return UIStatusBarStyle.default
            }
        }
    }
}
