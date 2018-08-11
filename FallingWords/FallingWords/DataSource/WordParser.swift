//
//  WordParser.swift
//  FallingWords
//
//  Created by Beatriz on 11.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

class WordParser {
    
    func parseColletion(items: [[String: String]]) -> [Word] {
        var parsedWords = [Word]()
        
        if let data = try? JSONSerialization.data(withJSONObject: items, options: .prettyPrinted) {
            parsedWords = try! JSONDecoder().decode([Word].self, from: data)
        }
        
        return parsedWords
    }
}
