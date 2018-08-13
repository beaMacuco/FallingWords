//
//  ViewController.swift
//  FallingWords
//
//  Created by Beatriz on 09.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import UIKit
import FontAwesome_swift

class GameViewController: UIViewController {
    
    private var game: Game?
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var roundResultMessage: UILabel!
    @IBOutlet weak var incorrectTranslationButton: UIButton! {
        didSet {
            incorrectTranslationButton.setTitleWithFontIcon(icon: .timesCircle, size: 60)
        }
    }
    
    @IBOutlet weak var correctTranslationButton: UIButton! {
        didSet {
            correctTranslationButton.setTitleWithFontIcon(icon: .checkCircle, size: 60)
        }
    }
    
    @IBOutlet weak var translation: UILabel! {
        didSet {
            translation.alpha = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createGame()
    }
    
    private func createGame(){
        let initializer = GameInitializer()
        initializer.createGame { (game) in
            self.game = game
        }
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(roundIsOver), name:.roundOver, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(countDown), name:.countDown, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(roundStarted), name:.roundStarted, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(possibleTranslation), name:.possibleTranslation, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playerResult), name:.playerResult, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(gameIsOver), name:.gameIsOver, object: nil)
    }

    private func removeObserver(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func roundIsOver(notification: Notification) {
        fadeOutTranslationOptionLabel()
    }
    
    @objc private func countDown(notification: Notification){
        let secondsLeft = notification.userInfo![NotificationKeys.secondsLeftKey] as! Int
        setupCounterText(secondsLeft: secondsLeft)
    }
    
    @objc private func possibleTranslation(notification: Notification){
        let possibleTranslation = notification.userInfo![NotificationKeys.possibleTranslationKey] as! Word
        word.text = possibleTranslation.wordEnglish
        translation.text = possibleTranslation.wordSpanish
    }
    
    @objc private func roundStarted(notification: Notification){
        let duration = notification.userInfo![NotificationKeys.roundDurationKey] as! Int
        animateWordVerticallyAcrossScreen(duration: duration)
        setupCounterText(secondsLeft: duration)
    }
    
    private func setupCounterText(secondsLeft: Int){
        counter.text! = (secondsLeft >= 10) ? "\(secondsLeft)" : "0\(secondsLeft)"
    }
    
    @IBAction func userPressedIncorrectTranslation(_ sender: Any){
        translation.layer.removeAllAnimations()
        game?.handlePlayerChoiceForRound(chosenTranslation: false)
    }
    
    @IBAction func userPressedCorrectTranslation(_ sender: Any) {
        translation.layer.removeAllAnimations()
        game?.handlePlayerChoiceForRound(chosenTranslation: true)
    }

    private func animateWordVerticallyAcrossScreen(duration: Int){
        let x : CGFloat = 10
        var y : CGFloat = 0
        let width = view.frame.width - 20
        let height = translation.frame.height

        translation.frame = CGRect(x: x, y: y, width: width, height: height)
        
        fadeInTranslationOptionLabel()
        
        UIView.animate(withDuration: Double(duration), delay: 0, animations: {
            y = self.view.frame.height - height
            self.translation.frame = CGRect(x: x, y: y, width: width, height: height)
        })
    }
    
    private func fadeInTranslationOptionLabel(){
        translation.fadeInWithDuration(duration: 0.5)
    }
    
    private func fadeOutTranslationOptionLabel(){
        translation.fadeOutWithDuration(duration: 0.5)
    }
    
    @objc private func playerResult(notification: Notification){
        let result = notification.userInfo![NotificationKeys.resultKey] as! Bool
        displayResultToPlayer(result: result)
    }
    
    private func displayResultToPlayer(result: Bool){
        roundResultMessage.text = result ? "🎉" : "😬"
        roundResultMessage.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.game?.onPlayerScoredFeedbackOver()
            self.roundResultMessage.isHidden = true
        }
    }
    
    @objc private func gameIsOver(notification: Notification){
        let message = notification.userInfo![NotificationKeys.resultMessageKey] as! String
        displayGameOverController(message: message)
    }
    
    private func displayGameOverController(message: String){
        let endOfGameController = EndGameViewController(message: message)
        present(endOfGameController, animated: true, completion: {
            self.game = nil
        })
    }
}
