//
//  GameResultProvidable.swift
//  FallingWords
//
//  Created by Beatriz on 12.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

protocol GameResultProvidable {
    func getGameResult(totalScore: Int, amountOrRounds: Int) -> String
}
