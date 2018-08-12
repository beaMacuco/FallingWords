//
//  EndGameViewController.swift
//  FallingWords
//
//  Created by Beatriz on 12.08.18.
//  Copyright © 2018 Beatriz. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {
    
    private let message: String
    
    @IBOutlet weak var messageToPlayer: UILabel! {
        didSet {
            messageToPlayer.text = message
        }
    }
    
    init(message: String) {
        self.message = message
        super.init(nibName:"GameEndView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func playGameAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
