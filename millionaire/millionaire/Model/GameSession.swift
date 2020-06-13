//
//  GameSession.swift
//  millionaire
//
//  Created by Evgeny Kolesnik on 03.06.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import UIKit

class GameSession: Codable {
    var numberQestion: Int = 0
    var rightQestion: Int = 0
    var resultGame: String = ""
    var currentNumber = Observable<Int>(0)
    
    private enum CodingKeys: String, CodingKey {
        case numberQestion
        case rightQestion
        case resultGame
    }

    init() {
    }

    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        numberQestion = try values.decode(Int.self, forKey: .numberQestion)
        rightQestion = try values.decode(Int.self, forKey: .rightQestion)
        resultGame = try values.decode(String.self, forKey: .resultGame)
    }
    
}
