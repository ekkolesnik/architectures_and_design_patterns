//
//  QestionJSON.swift
//  millionaire
//
//  Created by Evgeny Kolesnik on 07.06.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import UIKit

struct QuestionJSON: Codable {
    
    var question: String
    var answer: [String]
    var rightAnswer: String
    var id: Int
    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//    
//    static func == (lhs: QuestionJSON, rhs: QuestionJSON) -> Bool {
//        return lhs.id == rhs.id
//    }
    
}
