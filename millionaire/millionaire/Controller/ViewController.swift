//
//  ViewController.swift
//  millionaire
//
//  Created by Evgeny Kolesnik on 03.06.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var newGame: GameSession?
    
    weak var delegate: GameSessionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func playGameButton(_ sender: Any) {
        Game.activate.gameSession = .init()
    }
}

extension ViewController: GameSessionDelegate {
    func numberQuestion(number: Int) {
        Game.activate.gameSession?.numberQestion = number
        print(#function)
    }

    func rightQuestion(number: Int) {
        Game.activate.gameSession?.rightQestion = number
    }
}
