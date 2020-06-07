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

    static let activate: Game = .init()
    
    private let recordsCaretaker = RecordsCaretaker()
    
    private(set) var records: [GameSession] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }

    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
    }
    
    func result() {
        let right = gameSession!.rightQestion
        let num = gameSession!.numberQestion
        let percent = String(Double(right) / Double(num) * 100)
        Game.activate.gameSession?.resultGame = percent
        self.records.append(gameSession!)
    }
    
}
