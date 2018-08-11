//
//  GenerateWordCollection.swift
//  FallingWordsTests
//
//  Created by Beatriz on 11.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

class GenerateWordCollection {
    
    var words : [Word] {
        let words = [["text_eng":"primary school", "text_spa":"escuela primaria"], ["text_eng":"teacher", "text_spa":"profesor / profesora"],["text_eng":"pupil","text_spa":"alumno / alumna"]]
        
        let wordParser = WordParser()
        return wordParser.parseColletion(items: words)
    }
}
