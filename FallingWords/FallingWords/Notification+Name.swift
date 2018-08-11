//
//  Notification+Name.swift
//  FallingWords
//
//  Created by Beatriz on 11.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let countDown = Notification.Name("countDown")
    static let roundOver = Notification.Name("roundOver")
    static let roundStarted = Notification.Name("roundStarted")
    static let gameIsOver = Notification.Name("gameIsOver")
    static let possibleTranslation = Notification.Name("possibleTranslation")
}
