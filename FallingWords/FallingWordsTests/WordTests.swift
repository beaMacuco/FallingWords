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

class WordsTest: XCTestCase {
    
    let words = [["text_eng":"primary school", "text_spa":"escuela primaria"], ["text_eng":"teacher", "text_spa":"profesor / profesora"],["text_eng":"pupil","text_spa":"alumno / alumna"]]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEnglishTextGetsSetCorrectly() {
        let parsedWords = parseWords()
        
        let expected = "primary school"
        let result = parsedWords.first!.wordEnglish
        
        XCTAssert(expected == result)
    }
    
    func testSpanishTextGetsSetCorrectly(){
        let parsedWords = parseWords()
        
        let expected = "escuela primaria"
        let result = parsedWords.first!.wordSpanish
        
        XCTAssert(expected == result)
    }
    
    private func parseWords() -> [Word] {
        var parsedWords = [Word]()
        
        if let data = try? JSONSerialization.data(withJSONObject: words, options: .prettyPrinted) {
            parsedWords = try! JSONDecoder().decode([Word].self, from: data)
        }
        
        return parsedWords
    }
}
