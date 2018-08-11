//
//  GameCreatable.swift
//  FallingWords
//
//  Created by Beatriz on 12.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

protocol GameCreatable {
    func createGame(result: @escaping(Game) -> Void)
}
