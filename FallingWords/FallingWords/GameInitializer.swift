//
//  GameInitializer.swift
//  FallingWords
//
//  Created by Beatriz on 12.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

class GameInitializer : GameCreatable {
    
    private let amountOfRounds = 5
    private let roundDuration = 20
    
    func createGame(result: @escaping(Game) -> Void){
        let player = Player()
        let wordRetriever = WordsSampleRetriever()
        
        wordRetriever.fetchItems { (words) in
            let roundProvider = RoundProvider(words: words, amountOfRounds:self.amountOfRounds, roundDuration: self.roundDuration, scoreProvidable: ScoreProvider())
            
            let game = Game(amountOfRounds: self.amountOfRounds,
                            player: player,
                            roundCreatable: roundProvider, gameResultProvidable: GameResultProvider())
            
            result(game)
        }
    }
}
