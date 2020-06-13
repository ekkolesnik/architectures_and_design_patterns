//
//  Strategy.swift
//  millionaire
//
//  Created by Evgeny Kolesnik on 07.06.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import UIKit

protocol GameStrategy {
    func choiceOfStrategy(array: [QuestionJSON]) -> [QuestionJSON]
}

class СonsistentlyStrategy: GameStrategy {
    func choiceOfStrategy(array: [QuestionJSON]) -> [QuestionJSON] {
        let array = array
        
        return array
    }
}

class RendomStrategy: GameStrategy {
    func choiceOfStrategy(array: [QuestionJSON]) -> [QuestionJSON] {
        let array = array.shuffled()
        
        return array
    }
}
