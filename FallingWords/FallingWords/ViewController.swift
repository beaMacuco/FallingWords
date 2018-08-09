//
//  ViewController.swift
//  FallingWords
//
//  Created by Beatriz on 09.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var timer = Timer()
    
    private var seconds = 20 {
        didSet {
            counter.text! = (seconds >= 10) ? "\(seconds)" : "0\(seconds)"
        }
    }
    
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var incorrectTranslationButton: UIButton!
    @IBOutlet weak var correctTranslationButton: UIButton!
    @IBOutlet weak var translation: UILabel!
    
    @IBAction func userPressedIncorrectTranslation(_ sender: Any){
    }
    
    @IBAction func userPressedCorrectTranslation(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGameRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func startGameRound(){
        runTimer()
        animateWord()
    }

    private func runTimer(){
        timer = Timer.scheduledTimer(timeInterval:1,
                                     target: self,
                                     selector: #selector(updateCounter),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    private func animateWord(){
        
        let x = view.frame.width/2 - translation.frame.height
        var y : CGFloat = 0
        let width = translation.frame.width
        let height = translation.frame.height
        
        translation.frame = CGRect(x: x, y: y, width: width, height: height)
        translation.alpha = 0

        UIView.animate(withDuration: 1, delay: 0, options: .allowUserInteraction, animations: {
            self.translation.alpha = 1
        })
        
        UIView.animate(withDuration: Double(seconds), delay: -1, options: .allowUserInteraction, animations: {
            y = self.view.frame.height - height
            self.translation.frame = CGRect(x: x, y: y, width: width, height: height)
        })
    }
    
    @objc private func updateCounter(){
        seconds -= 1
        
        if(seconds == 0) {
            resetTimer()
        }
        
        if(seconds == 1) {
            //takes last second to fade
            UIView.animate(withDuration: 1, delay: 0, options: .allowUserInteraction, animations: {
                self.translation.alpha = 0
            })
        }
    }
    
    private func resetTimer(){
        timer.invalidate()
    }
}

