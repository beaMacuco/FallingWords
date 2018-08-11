//
//  WordTests.swift
//  FallingWordsTests
//
//  Created by Beatriz on 11.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

import XCTest
@testable import FallingWords

class WordTests: XCTestCase {
    
    private let parsedWords = GenerateWordCollection().words
    
    private func testEnglishTextGetsSetCorrectly() {
        
        let expected = "primary school"
        let result = parsedWords.first!.wordEnglish
        
        XCTAssert(expected == result)
    }
    
    private func testSpanishTextGetsSetCorrectly(){
        let expected = "escuela primaria"
        let result = parsedWords.first!.wordSpanish
        
        XCTAssert(expected == result)
    }
}
