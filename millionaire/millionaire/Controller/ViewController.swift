//
//  ViewController.swift
//  millionaire
//
//  Created by Evgeny Kolesnik on 03.06.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameSegue" {
            guard let distanation = segue.destination as? GameViewController else { return }
            distanation.gameDelegate = self
            
            Game.activate.gameSession = .init()
            
        }
    }
}

extension ViewController: GameSessionDelegate {
    
    func updateFunc(number: Int, right: Int) {
        Game.activate.gameSession?.numberQestion = number
        Game.activate.gameSession?.rightQestion = right
        Game.activate.result()
    }
}
