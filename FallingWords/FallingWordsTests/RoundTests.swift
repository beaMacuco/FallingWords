//
//  RoundTests.swift
//  FallingWordsTests
//
//  Created by Beatriz on 11.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

import XCTest
@testable import FallingWords

class RoundTest: XCTestCase {
    
    private let word = Word(wordEnglish: "test", wordSpanish: "teste")

    private func testRoundStartsWhenClassInitialized() {
        expectation(forNotification: .roundStarted, object: nil, handler: nil)
        let _ = Round(possibleTranslation: word, isTranslation: true, roundDuration: 2, scoreProvidable: ScoreProvider())
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    private func testGetsCountedDown() {
        let roundDuration = 4
        let expected = roundDuration - 1
        
        expectation(forNotification: .countDown, object: nil, handler: { (notification) -> Bool in
            let result = notification.userInfo![NotificationKeys.secondsLeftKey] as? Int
            
            return result == expected
        })
        
        let _ = Round(possibleTranslation: word, isTranslation: true, roundDuration: roundDuration, scoreProvidable: ScoreProvider())
        waitForExpectations(timeout: 1.5, handler: nil)
    }
    
    private func testRoundIsOver() {
        expectation(forNotification: .roundOver, object: nil, handler: nil)
        let _ = Round(possibleTranslation: word, isTranslation: true, roundDuration: 2, scoreProvidable: ScoreProvider())
        waitForExpectations(timeout: 2, handler: nil)
    }
    
}
