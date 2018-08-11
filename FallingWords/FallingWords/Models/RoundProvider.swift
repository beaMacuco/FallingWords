//
//  RoundProvider.swift
//  FallingWords
//
//  Created by Beatriz on 11.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

class RoundProvider : RoundCreatable {
    
    private var words: [Word]
    private let amountOfRounds: Int
    private let roundDuration: Int
    private let scoreProvidable: ScoreProvidable
    
    private lazy var isTranslationArray: [Bool] = {
        return createRandomIsTranslationArray()
    }()
    
    init(words: [Word], amountOfRounds: Int, roundDuration: Int, scoreProvidable: ScoreProvidable){
        self.words = words
        self.amountOfRounds = amountOfRounds
        self.roundDuration = roundDuration
        self.scoreProvidable = scoreProvidable
    }
    
    func createRound() -> Round {
        let isTraslation = isTranslationArray.removeLast()
        let possibleTranslation = getPossibleTranslation(isTranslation: isTraslation)
        
        return Round(possibleTranslation: possibleTranslation,
                     isTranslation: isTraslation,
                     roundDuration: self.roundDuration,
                     scoreProvidable: self.scoreProvidable)
    }
    
    private func getPossibleTranslation(isTranslation: Bool ) -> Word {
        var possibleTranlation = removeRandomItemFromArray()
        
        if(!isTranslation) {
            let randomSample = removeRandomItemFromArray()
            possibleTranlation = Word(wordEnglish: possibleTranlation.wordEnglish, wordSpanish: randomSample.wordSpanish)
        }
        
        return possibleTranlation
    }
    
    private func createRandomIsTranslationArray() -> [Bool] {
        var isTranslationArray = [Bool]()
        
        for _ in 0...amountOfRounds {
            let randomBool = arc4random_uniform(2) == 1
            isTranslationArray.append(randomBool)
        }
        
        return isTranslationArray
    }
    
    private func removeRandomItemFromArray() -> Word {
        let count = words.count
        let randomIndex = Int(arc4random_uniform(UInt32(count)))
        
        return words.remove(at: randomIndex)
    }
}
