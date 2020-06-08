//
//  GameViewController.swift
//  millionaire
//
//  Created by Evgeny Kolesnik on 03.06.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import UIKit

protocol GameSessionDelegate: class {
    func updateFunc(number: Int, right: Int, currentNumber: Int)
}

class GameViewController: UIViewController {

    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var infoButton: UILabel!
    
    weak var gameDelegate: GameSessionDelegate?
    
    var index = 0
    var numberOfQuestions = 5
    var rightQestion = 0
    var currentNumber = 0
    
    var strategy: GameStrategy = Game.activate.strategy //СonsistentlyStrategy()
    
    let arrayJSON = Bundle.main.decode([QuestionJSON].self, from: "question.json")
    
    var question: QuestionJSON?
    
    let observer = Observer()
    
    func setupQuestion() {
        
        question = strategy.choiceOfStrategy(index: index, array: arrayJSON)
        
        questionTextLabel.text = question!.question
        answerButton1.setTitle(question!.answer[0], for: .normal)
        answerButton2.setTitle(question!.answer[1], for: .normal)
        answerButton3.setTitle(question!.answer[2], for: .normal)
        answerButton4.setTitle(question!.answer[3], for: .normal)
        
    }
    
    func responseCheck(number: Int) {
        
        guard let question = question else { return }
        
        if index == 4 && question.answer[number] == question.rightAnswer {
            print(index)
            index = 0
            rightQestion += 1
            endGame()
        } else if question.answer[number] == question.rightAnswer {
            print(index)
            index += 1
            rightQestion += 1
            setupQuestion()
        } else {
            index = 0
            endGame()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestion()
        
    }
    
    func renameButton(arrayAnswer: [String]) {
        
        let number = arrayAnswer
        
        answerButton1.setTitle(number[0], for: .normal)
        answerButton2.setTitle(number[1], for: .normal)
        answerButton3.setTitle(number[2], for: .normal)
        answerButton4.setTitle(number[3], for: .normal)
    }
    
    @IBAction func answerButton1(_ sender: Any) {
        responseCheck(number: 0)
    }
    
    @IBAction func answerButton2(_ sender: Any) {
        responseCheck(number: 1)
    }
    
    @IBAction func answerButton3(_ sender: Any) {
        responseCheck(number: 2)
    }
    
    @IBAction func answerButton4(_ sender: Any) {
        responseCheck(number: 3)
    }
    
    func endGame() {
        self.gameDelegate?.updateFunc(number: numberOfQuestions, right: rightQestion, currentNumber: currentNumber)
        self.dismiss(animated: true, completion: nil)
    }
}


