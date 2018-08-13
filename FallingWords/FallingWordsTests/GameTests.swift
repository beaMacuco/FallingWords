//
//  GameTests.swift
//  FallingWords
//
//  Created by Beatriz on 11.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

import XCTest
@testable import FallingWords

class GameTests: XCTestCase {
    
    private let parsedWords = GenerateWordCollection().words

    private func testGameCreatesRounds() {
        expectation(forNotification: .roundStarted, object: nil, handler: nil)
        let roundProvider = RoundProvider(words: parsedWords, amountOfRounds: 2, roundDuration: 10, scoreProvidable: ScoreProvider())
        let _ = Game(amountOfRounds: 2, roundCreatable: roundProvider, gameResultProvidable: GameResultProvider())
        waitForExpectations(timeout: 0.5, handler: nil)
    }

    private func testGameIsOver() {
        expectation(forNotification: .gameIsOver, object: nil, handler: nil)
        let roundProvider = RoundProvider(words: parsedWords, amountOfRounds: 2, roundDuration: 10, scoreProvidable: ScoreProvider())
        let _ = Game(amountOfRounds: 2, roundCreatable: roundProvider, gameResultProvidable: GameResultProvider())
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    private func testPlayerChoiceMadeEndsRound() {
        expectation(forNotification: .roundOver, object: nil, handler: nil)
        let roundProvider = RoundProvider(words: parsedWords, amountOfRounds: 2, roundDuration: 10, scoreProvidable: ScoreProvider())
        let game = Game(amountOfRounds: 2, roundCreatable: roundProvider, gameResultProvidable: GameResultProvider())
        game.handlePlayerChoiceForRound(chosenTranslation: true)
        waitForExpectations(timeout: 0.5, handler: nil)
    }
}
