//
//  RoundProviderTests.swift
//  FallingWordsTests
//
//  Created by Beatriz on 11.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

import XCTest
@testable import FallingWords

class RoundProviderTest: XCTestCase {
    
    private let parsedWords = GenerateWordCollection().words
    
    private func testRoundDurationGetsSetCorrectly() {
        
        let expected = 4
        expectation(forNotification: .roundStarted, object: nil, handler: { (notification) -> Bool in
            let result = notification.userInfo![NotificationKeys.roundDurationKey] as? Int
            
            return result == expected
        })
        
        let roundProvider = RoundProvider(words: parsedWords, amountOfRounds: 3, roundDuration: 10)
        let _ = roundProvider.createRound()
        
        waitForExpectations(timeout: Double(expected), handler: nil)
    }
    
    func testRoundProviderSetsAmountOfRoundsCorrectly(){
        
    }
    
    func testRoundProviderSetsPossibleWordCorrectly(){
        expectation(forNotification: .possibleTranslation, object: nil, handler: { (notification) -> Bool in
            let result = notification.userInfo![NotificationKeys.possibleTranslationKey] as? Int
            
            return result == expected
        })
        
        let roundProvider = RoundProvider(words: parsedWords, amountOfRounds: 3, roundDuration: 10)
        let _ = roundProvider.createRound()
        
        waitForExpectations(timeout: 2, handler: nil)
    }
}

