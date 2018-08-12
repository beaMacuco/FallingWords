//
//  Round.swift
//  FallingWords
//
//  Created by Beatriz on 11.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import Foundation

class Round {
    
    private let roundDuration: Int
    private var countDown: Int
    private let scoreProvidable: ScoreProvidable
    private var timer : Timer = Timer()
    
    let possibleTranslation: Word
    let isTranslation: Bool
    
    init(possibleTranslation: Word,
         isTranslation: Bool,
         roundDuration: Int,
         scoreProvidable: ScoreProvidable) {
        
        self.possibleTranslation = possibleTranslation
        self.isTranslation = isTranslation
        self.roundDuration = roundDuration
        self.countDown = roundDuration
        self.scoreProvidable = scoreProvidable
        
        startRound()
    }
    
    private func startRound(){
        postCurrentWord()
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
        notifyCurrentCountDown()
        
        if countDownIsOver() {
            endRound()
        }
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
        stopTimer()
    }
    
    private func notifyPlayerResult(correctChoice: Bool) {
        NotificationCenter.default.post(name: .playerResult, object: nil, userInfo: [NotificationKeys.resultKey: correctChoice])
    }
    
    private func removeObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func stopTimer(){
        timer.invalidate()
    }
    
    func handlePlayerChoice(chosenTranslation: Bool) {
        let correctChoice = scoreProvidable.shouldAddPoint(isTranslation: isTranslation, choseIsTranslation: chosenTranslation)
        notifyPlayerResult(correctChoice: correctChoice)
        endRound()
    }
}
