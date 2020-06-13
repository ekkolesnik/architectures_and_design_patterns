//
//  SettingsViewController.swift
//  millionaire
//
//  Created by Evgeny Kolesnik on 07.06.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func consistentlyButton(_ sender: Any) {
        
        let strategy: GameStrategy = СonsistentlyStrategy()
        Game.activate.strategy = strategy
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func randomeButton(_ sender: Any) {
        
        let strategy: GameStrategy = RendomStrategy()
        Game.activate.strategy = strategy
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
