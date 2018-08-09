//
//  Button+FontIcon.swift
//  FallingWords
//
//  Created by Beatriz on 09.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import UIKit
import FontAwesome_swift

extension UIButton {
    
    func setTitleWithFontIcon(icon: FontAwesome, size: CGFloat) {
        titleLabel?.font = UIFont.fontAwesome(ofSize: size, style: .regular)
        setTitle(String.fontAwesomeIcon(name: icon), for: .normal)
    }
    
}
