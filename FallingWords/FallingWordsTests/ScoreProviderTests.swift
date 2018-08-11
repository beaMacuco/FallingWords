//
//  ScoreCounterTests.swift
//  FallingWords
//
//  Created by Beatriz on 11.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

import XCTest
@testable import FallingWords

class ScoreProviderTests: XCTestCase {

    private func testScoreProviderReturnsFalseUserPicksWrongAnswer(){
        let expected = false
        let scoreProvider = ScoreProvider()
        let result = scoreProvider.shouldAddPoint(isTranslation: true, choseIsTranslation: false)
        
        XCTAssertTrue(result == expected)
    }
    
    private func testScoreProviderReturnsTrueUserPicksCorrectAnswer(){
        let expected = true
        let scoreProvider = ScoreProvider()
        let result = scoreProvider.shouldAddPoint(isTranslation: false, choseIsTranslation: false)
        
        XCTAssertTrue(result == expected)
    }
    
}
