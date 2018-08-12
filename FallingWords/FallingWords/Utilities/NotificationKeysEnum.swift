//
//  DictionaryKeysEnum.swift
//  FallingWords
//
//  Created by Beatriz on 11.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

enum NotificationKeys: String, CodingKey {
    
    case valuesKey = "values"
    case resultKey = "result"
    case roundDurationKey = "roundDuration"
    case secondsLeftKey = "secondsLeft"
    case wordsKey = "words"
    case possibleTranslationKey = "possibleTranslation"
    case resultMessageKey = "resultMessage"
}
