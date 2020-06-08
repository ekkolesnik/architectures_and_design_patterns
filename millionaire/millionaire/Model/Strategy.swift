//
//  Strategy.swift
//  millionaire
//
//  Created by Evgeny Kolesnik on 07.06.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import UIKit

protocol GameStrategy {
    func choiceOfStrategy(index: Int, array: [QuestionJSON]) -> QuestionJSON
}

class СonsistentlyStrategy: GameStrategy {
    func choiceOfStrategy(index: Int, array: [QuestionJSON]) -> QuestionJSON {
        let array = array[index]
        
        return array
    }
}

class RendomStrategy: GameStrategy {
    func choiceOfStrategy(index: Int, array: [QuestionJSON]) -> QuestionJSON {
        let array = array.randomElement()!
        
        return array
    }
}
