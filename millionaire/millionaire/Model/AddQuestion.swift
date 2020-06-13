//
//  AddQuestion.swift
//  millionaire
//
//  Created by Evgeny Kolesnik on 12.06.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import UIKit

struct AddQuestion: Codable {
    
    var question: String = ""
    var answers = [String]()
    var rightAnswer: String = ""
    var id: Int = 0
    
}
