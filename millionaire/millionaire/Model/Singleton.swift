//
//  Singleton.swift
//  millionaire
//
//  Created by Evgeny Kolesnik on 03.06.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import UIKit

class Game {
    
    var gameSession: GameSession?
    
    var addQuestion: AddQuestion?

    static let activate: Game = .init()
    
    var strategy: GameStrategy = СonsistentlyStrategy()
    
    var question = [QuestionJSON]()
    
    var questionAdd = [AddQuestion]()
    
    private let recordsCaretaker = RecordsCaretaker()
    
    private(set) var records: [GameSession] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }
    
    private let addQuestionCaretaker = AddQuestionCaretaker()
    
    private(set) var recordsAdd: [AddQuestion] {
        didSet {
            addQuestionCaretaker.save(records: self.recordsAdd)
        }
    }

    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
        self.recordsAdd = self.addQuestionCaretaker.retrieveRecords()
    }
    
    func result() {
        let right = gameSession!.rightQestion
        let num = gameSession!.numberQestion
        let percent = String(Double(right) / Double(num) * 100)
        Game.activate.gameSession?.resultGame = percent
        self.records.append(gameSession!)
        
    }
    
    func addResult() {
        self.recordsAdd.append(addQuestion!)
    }
    
}
