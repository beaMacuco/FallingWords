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
    private let roundCreatable: RoundCreatable
    private let amountOfRounds: Int
    private var roundCount = 1
    private var currentRound: Round?
    
    init(amountOfRounds: Int,
         player: Player,
         roundCreatable: RoundCreatable) {
        
        self.player = player
        self.roundCreatable = roundCreatable
        self.amountOfRounds = amountOfRounds
        
        addObservers()
        setupNextRound()
    }
    
    private func addObservers(){
        addObserverForEndOfRound()
        addObserverForRoundResult()
    }
    
    private func addObserverForRoundResult(){
        NotificationCenter.default.addObserver(self, selector: #selector(playerResult), name:.playerResult, object: nil)
    }
    
    private func addObserverForEndOfRound(){
        NotificationCenter.default.addObserver(self, selector: #selector(roundIsOver), name:.roundOver, object: nil)
    }
    
    @objc private func playerResult(notification: Notification){
        let isCorrect = notification.userInfo![NotificationKeys.resultKey] as! Bool
        if(isCorrect){
            addAPointToPlayerScore()
        }
    }
    
    private func addAPointToPlayerScore(){
        player.score = player.score + 1
    }
    
    @objc private func roundIsOver(notification: Notification){
        setupNextRound()
    }
    
    private func setupNextRound() {
        if(!gameIsOver()){
            currentRound = roundCreatable.createRound()
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
    
    func handlePlayerChoiceForRound(chosenTranslation: Bool) {
        currentRound?.handlePlayerChoice(chosenTranslation: chosenTranslation)
    }
}
