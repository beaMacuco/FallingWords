//
//  ScoreCounter.swift
//  FallingWords
//
//  Created by Beatriz on 11.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

class ScoreProvider {
    
    func shouldAddPoint(isTranslation: Bool, choseIsTranslation: Bool) -> Bool {
        return choseIsTranslation == isTranslation
    }
}
