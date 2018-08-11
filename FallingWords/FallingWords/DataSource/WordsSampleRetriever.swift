//
//  WordsSampleRetriever.swift
//  FallingWords
//
//  Created by Beatriz on 09.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

class WordsSampleRetriever {
    
    public func fetchItems(result: @escaping([Word]) -> Void){
        
        DispatchQueue.global(qos: .background).async {
            
            if let path = Bundle.main.path(forResource: "words", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let words = try JSONDecoder().decode([Word].self, from: data)
                    
                    DispatchQueue.main.async {
                        result(words)
                    }
                } catch {
                    DispatchQueue.main.async {
                        print("\(#function) \(error)")
                    }
                }
            }
        }
    }
}
