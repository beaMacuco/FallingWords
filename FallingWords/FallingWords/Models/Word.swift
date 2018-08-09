//
//  Word.swift
//  FallingWords
//
//  Created by Beatriz on 09.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

class Word : Codable {

    let wordEnglish: String
    let wordSpanish: String
    
    init(wordEnglish: String, wordSpanish: String) {
        self.wordEnglish = wordEnglish
        self.wordSpanish = wordSpanish
    }
    
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WordCodingKeys.self)
        
        let english = try container.decode(String.self, forKey: WordCodingKeys.wordEnglishKey)
        let spanish = try container.decode(String.self, forKey: WordCodingKeys.workSpanishKey)
        
        self.init(wordEnglish: english, wordSpanish: spanish)
    }
    
    enum WordCodingKeys: String, CodingKey {
        case wordEnglishKey = "text_eng"
        case workSpanishKey = "text_spa"
    }

}
