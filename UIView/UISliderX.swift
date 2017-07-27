//
//  UISliderX.swift
//  ViewBoilerPlate
//
//  Created by DonPaulPM on 27/07/17.
//  Copyright © 2017 DonPaulPM. All rights reserved.
//

import UIKit

@IBDesignable
class UISliderX: UISlider {

    @IBInspectable var thumbImage: UIImage? {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var thumbHighlightedImage: UIImage? {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        setThumbImage(thumbImage, for: .normal)
        
        if let highlighted = thumbHighlightedImage {
            setThumbImage(highlighted, for: .highlighted)
        } else {
            setThumbImage(thumbImage, for: .highlighted)
        }
    }
}
