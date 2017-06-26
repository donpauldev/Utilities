//
//  TransitionSubmitButton.swift
//  TransitionSubmitButton Swift
//
//  Created by Don Paul on 15/02/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit


let L_BG = Utilities.FGColour()
let D_BG = Utilities.D_FGColour()

@IBDesignable
open class TKTransitionSubmitButton : UIButton, UIViewControllerTransitioningDelegate, CAAnimationDelegate {
    
    open var didEndFinishAnimation : (()->())? = nil

    let springGoEase = CAMediaTimingFunction(controlPoints: 0.45, -0.36, 0.44, 0.92)
    let shrinkCurve = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    let expandCurve = CAMediaTimingFunction(controlPoints: 0.95, 0.02, 1, 0.05)
    let shrinkDuration: CFTimeInterval  = 0.1

    lazy var spiner: SpinerLayer! = {
        let s = SpinerLayer(frame: self.frame)
        self.layer.addSublayer(s)
        return s
    }()

    @IBInspectable open var highlightedBackgroundColor: UIColor? = D_BG {
        didSet {
            self.setBackgroundColor()
        }
    }
    @IBInspectable open var normalBackgroundColor: UIColor? = L_BG {
        didSet {
            self.setBackgroundColor()
        }
    }

    var cachedTitle: String?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    override open var isHighlighted: Bool {
        didSet {
            self.setBackgroundColor()
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    func setup() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        self.setBackgroundColor()
    }

    func setBackgroundColor() {
        if (isHighlighted) {
            self.backgroundColor = highlightedBackgroundColor
        }
        else {
            self.backgroundColor = normalBackgroundColor
        }
    }

    open func startLoadingAnimation() {
        self.cachedTitle = title(for: UIControlState())
        self.setTitle("", for: UIControlState())
        self.shrink()
        Timer.schedule(delay: shrinkDuration - 0.25) { timer in
            self.spiner.animation()
        }
    }

    open func startFinishAnimation(_ delay: TimeInterval, completion:(()->())?) {
        Timer.schedule(delay: delay) { timer in
            self.didEndFinishAnimation = completion
            self.expand()
            self.spiner.stopAnimation()
        }
    }

    open func animate(_ duration: TimeInterval, completion:(()->())?) {
        startLoadingAnimation()
        startFinishAnimation(duration, completion: completion)
    }

    open func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let a = anim as! CABasicAnimation
        if a.keyPath == "transform.scale" {
            didEndFinishAnimation?()
            Timer.schedule(delay: 1) { timer in
                self.returnToOriginalState()
            }
        }
    }
    
    func returnToOriginalState() {
        self.layer.removeAllAnimations()
        self.setTitle(self.cachedTitle, for: UIControlState())
    }
    
    func shrink() {
        let shrinkAnim = CABasicAnimation(keyPath: "bounds.size.width")
        shrinkAnim.fromValue = frame.width
        shrinkAnim.toValue = frame.height
        shrinkAnim.duration = shrinkDuration
        shrinkAnim.timingFunction = shrinkCurve
        shrinkAnim.fillMode = kCAFillModeForwards
        shrinkAnim.isRemovedOnCompletion = false
        layer.add(shrinkAnim, forKey: shrinkAnim.keyPath)
    }
    
    func expand() {
        let expandAnim = CABasicAnimation(keyPath: "transform.scale")
        expandAnim.fromValue = 1.0
        expandAnim.toValue = 26.0
        expandAnim.timingFunction = expandCurve
        expandAnim.duration = 0.3
        expandAnim.delegate = self
        expandAnim.fillMode = kCAFillModeForwards
        expandAnim.isRemovedOnCompletion = false
        layer.add(expandAnim, forKey: expandAnim.keyPath)
    }
    
}
