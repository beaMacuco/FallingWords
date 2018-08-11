//
//  Round.swift
//  FallingWords
//
//  Created by Beatriz on 11.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

import Foundation

class Round {
    
    private let roundDuration: Int
    private var countDown: Int
    private var timer = Timer()
    
    let possibleTranslation: Word
    let isTranslation: Bool
    
    init(possibleTranslation: Word,
         isTranslation: Bool,
         roundDuration: Int) {
        
        self.possibleTranslation = possibleTranslation
        self.isTranslation = isTranslation
        self.roundDuration = roundDuration
        self.countDown = roundDuration
        
        startRound()
    }
    
    private func startRound(){
        notifyRoundStart()
        
        runTimer()
    }
    
    private func notifyRoundStart(){
        NotificationCenter.default.post(name: .roundStarted, object: nil, userInfo: [NotificationKeys.roundDurationKey: roundDuration])
    }
    
    private func postCurrentWord() {
        NotificationCenter.default.post(name: .possibleTranslation, object: nil, userInfo: [NotificationKeys.possibleTranslationKey: possibleTranslation])
    }
    
    private func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateRoundStatus),
                                     userInfo: nil,
                                     repeats: true)
        
    }
    
    @objc private func updateRoundStatus(){
        updateRoundTime()
        countDownIsOver() ? endRound() : notifyCurrentCountDown()
    }
    
    private func updateRoundTime(){
        countDown = countDown - 1
    }
    
    private func countDownIsOver() -> Bool {
        return countDown == 0
    }
    
    private func notifyRoundIsOver(){
        NotificationCenter.default.post(name: .roundOver, object: nil)
    }
    
    private func notifyCurrentCountDown(){
        NotificationCenter.default.post(name: .countDown, object: nil, userInfo: [NotificationKeys.secondsLeftKey : countDown])
    }
    
    private func endRound(){
        notifyRoundIsOver()
        resetRound()
    }
    
    private func resetRound(){
        timer.invalidate()
        countDown = roundDuration
    }
}
