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
    
    private init() {}
    
}
