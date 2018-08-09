//
//  UILabel+Fade.swift
//  FallingWords
//
//  Created by Beatriz on 09.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import UIKit

extension UILabel {
    
    func fadeInWithDuration(duration : Double) {
        UIView.animate(withDuration: duration, delay: 0, animations: {
            self.alpha = 1
        })
    }
    
    func fadeOutWithDuration(duration : Double) {
        UIView.animate(withDuration: duration, delay: 0, animations: {
            self.alpha = 0
        })
    }
}
