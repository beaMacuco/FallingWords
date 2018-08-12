//
//  GameResultProvider.swift
//  FallingWords
//
//  Created by Beatriz on 12.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

class GameResultProvider: GameResultProvidable {
    
    func getGameResult(totalScore: Int, amountOrRounds: Int) -> String {
        
        let halfOfRounds = amountOrRounds/2
        
        var resultMessage = ""
        
        if totalScore > halfOfRounds {
            resultMessage = "Congratulations!"
        } else {
            resultMessage = "Better luck next time!"
        }
        
        let scoreMessage = "You got \(totalScore) out of \(amountOrRounds) points."
        let dowloadBabbel = "Download Babbel app and enjoy learning!"
        
        let finalMessage = "\(resultMessage) \(scoreMessage) \(dowloadBabbel)"
        
        return finalMessage
    }
}
