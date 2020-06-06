//
//  GameViewController.swift
//  millionaire
//
//  Created by Evgeny Kolesnik on 03.06.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import UIKit

protocol GameSessionDelegate: class {
    func updateFunc(number: Int, right: Int)
}

class GameViewController: UIViewController {

    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    weak var gameDelegate: GameSessionDelegate?
    
    let qqq = Qestion.init()
    
    var qestion1 = ""
    var qestion2 = ""
    var qestion3 = ""
    var qestion4 = ""
    var qestion5 = ""
    
    var answer1 = ""
    var answer2 = ""
    var answer3 = ""
    var answer4 = ""
    var answer5 = ""
    
    var answerArray1 = [String]()
    var answerArray2 = [String]()
    var answerArray3 = [String]()
    var answerArray4 = [String]()
    var answerArray5 = [String]()
    
    var index = 0
    var numberOfQuestions = 5
    var rightQestion = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        qestion1 = qqq.question1
        qestion2 = qqq.question2
        qestion3 = qqq.question3
        qestion4 = qqq.question4
        qestion5 = qqq.question5
        
        answerArray1 = qqq.answerArray1
        answerArray2 = qqq.answerArray2
        answerArray3 = qqq.answerArray3
        answerArray4 = qqq.answerArray4
        answerArray5 = qqq.answerArray5
        
        answer1 = qqq.answer1
        answer2 = qqq.answer2
        answer3 = qqq.answer3
        answer4 = qqq.answer4
        answer5 = qqq.answer5

        questionTextLabel.text = qqq.question1
        
        renameButton(arrayAnswer: answerArray1)
        
        index = 1
        
    }
    
    func renameButton(arrayAnswer: [String]) {
        
        let number = arrayAnswer
        
        answerButton1.setTitle(number[0], for: .normal)
        answerButton2.setTitle(number[1], for: .normal)
        answerButton3.setTitle(number[2], for: .normal)
        answerButton4.setTitle(number[3], for: .normal)
    }
    
    @IBAction func answerButton1(_ sender: Any) {
        if index == 1 && answer1 == answerArray1[0] {
            questionTextLabel.text = qqq.question2
            renameButton(arrayAnswer: answerArray2)
            index = 2
            rightQestion += 1
        } else {
            index = 0
            endGame()
        }
    }
    
    @IBAction func answerButton2(_ sender: Any) {
        if index == 2 && answer2 == answerArray2[1] {
            questionTextLabel.text = qqq.question3
            renameButton(arrayAnswer: answerArray3)
            index = 3
            rightQestion += 1
        } else if index == 5 && answer5 == answerArray5[1] {
            print("WIN!")
            index = 0
            rightQestion += 1
            endGame()
        } else {
            index = 0
            endGame()
        }
    }
    
    @IBAction func answerButton3(_ sender: Any) {
        if index == 3 && answer3 == answerArray3[2] {
            questionTextLabel.text = qqq.question4
            renameButton(arrayAnswer: answerArray4)
            index = 4
            rightQestion += 1
        }  else {
            index = 0
            endGame()
        }
    }
    
    @IBAction func answerButton4(_ sender: Any) {
        if index == 4 && answer4 == answerArray4[3] {
            questionTextLabel.text = qqq.question5
            renameButton(arrayAnswer: answerArray5)
            index = 5
            rightQestion += 1
        }  else {
            index = 0
            endGame()
        }
    }
    
    func endGame() {
        self.gameDelegate?.updateFunc(number: numberOfQuestions, right: rightQestion)
        self.dismiss(animated: true, completion: nil)
    }
}


