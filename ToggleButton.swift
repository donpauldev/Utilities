//
//  Utilities.swift
//  Utilities Swift
//
//  Created by Don Paul on 06/06/17.
//  Copyright © 2017. All rights reserved.
//

import UIKit

class SAFollowButton: UIButton {
    
    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = Colors.twitterBlue.cgColor
        layer.cornerRadius = frame.size.height/2
        
        setTitleColor(Colors.twitterBlue, for: .normal)
        addTarget(self, action: #selector(SAFollowButton.buttonPressed), for: .touchUpInside)
    }
    
    func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        
        isOn = bool
        
        let color = bool ? Colors.twitterBlue : .clear
        let title = bool ? "Following" : "Follow"
        let titleColor = bool ? .white : Colors.twitterBlue
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
    }

    
}
