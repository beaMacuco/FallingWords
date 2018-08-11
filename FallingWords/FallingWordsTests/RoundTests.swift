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
    
    private let roundDurationKey = "roundDuration"
    private let secondsLeftKey = "secondsLeft"
    
    let word = Word(wordEnglish: "test", wordSpanish: "teste")
    
    override func setUp() {
        super.setUp()
    }
    
    func testRoundStartsWhenRoundInitialized() {
        expectation(forNotification: .roundStarted, object: nil, handler: nil)
        let _ = Round(possibleTranslation: word, isTranslation: true, roundDuration: 2)
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func testGetsCountedDown() {
        let roundDuration = 4
        let expected = roundDuration - 1
        
        expectation(forNotification: .countDown, object: nil, handler: { (notification) -> Bool in
            let result = notification.userInfo![self.secondsLeftKey] as? Int
            
            return result == expected
        })
        
        let _ = Round(possibleTranslation: word, isTranslation: true, roundDuration: roundDuration)
        waitForExpectations(timeout: 1.5, handler: nil)
    }
    
    func testRoundIsOver() {
        expectation(forNotification: .roundOver, object: nil, handler: nil)
        let _ = Round(possibleTranslation: word, isTranslation: true, roundDuration: 2)
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testRoundDurationPassedAtRoundStart() {
        let expected = 4
        expectation(forNotification: .roundStarted, object: nil, handler: { (notification) -> Bool in
            let result = notification.userInfo![self.roundDurationKey] as? Int
            
            return result == expected
        })
        
        let _ = Round(possibleTranslation: word, isTranslation: true, roundDuration: expected)
        waitForExpectations(timeout: Double(expected), handler: nil)
    }
    
}
