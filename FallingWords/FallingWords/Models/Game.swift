//
//  Game.swift
//  FallingWords
//
//  Created by Beatriz on 11.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

import Foundation

class Game {
    
    private let player: Player
    private let roundProvider: RoundCreatable
    private let amountOfRounds: Int
    private var roundCount = 1
    private var currentRound: Round?
    
    init(amountOfRounds: Int,
         player: Player,
         roundProvider: RoundCreatable) {
        
        self.player = player
        self.roundProvider = roundProvider
        self.amountOfRounds = amountOfRounds
        
        addObserverForEndOfRound()
        setupNextRound()
    }
    
    private func addObserverForEndOfRound(){
        NotificationCenter.default.addObserver(self, selector: #selector(roundIsOver), name:.roundOver, object: nil)
    }
    
    @objc private func roundIsOver(notification : Notification){
        setupNextRound()
    }
    
    private func setupNextRound() {
        if(!gameIsOver()){
            currentRound = roundProvider.createRound()
        } else {
            notifyGameIsOver()
        }
    }
    
    private func gameIsOver() -> Bool {
        return roundCount > amountOfRounds
    }
    
    private func notifyGameIsOver(){
        NotificationCenter.default.post(name:.gameIsOver, object: nil)
    }
}
