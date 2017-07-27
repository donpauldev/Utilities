//
//  UIViewXRadialGradient.swift
//  ViewBoilerPlate
//
//  Created by DonPaulPM on 27/07/17.
//  Copyright © 2017 DonPaulPM. All rights reserved.
//

import UIKit

@IBDesignable
class UIViewXRadialGradient: UIView {
    
    @IBInspectable var InsideColor: UIColor = UIColor.clear
    @IBInspectable var OutsideColor: UIColor = UIColor.clear
    
    override func draw(_ rect: CGRect) {
        let colors = [InsideColor.cgColor, OutsideColor.cgColor] as CFArray
        let endRadius = min(frame.width, frame.height) / 2
        let radialCenter = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
        UIGraphicsGetCurrentContext()!.drawRadialGradient(gradient!, startCenter: radialCenter, startRadius: 0.0, endCenter: radialCenter, endRadius: endRadius, options: CGGradientDrawingOptions.drawsAfterEndLocation)
    }
}
