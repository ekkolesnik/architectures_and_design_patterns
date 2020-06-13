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
    @IBOutlet weak var infoButton: UILabel!
    
    weak var gameDelegate: GameSessionDelegate?
    
    var index = 0
    var numberOfQuestions = 0
    var rightQestion = 0
    
    var strategy: GameStrategy = Game.activate.strategy
    
    let arrayJSON = Bundle.main.decode([QuestionJSON].self, from: "question.json")
    
    var question: [QuestionJSON]?
    
    let observer = Observer()
    
    func setupQuestion() {
        
        question = strategy.choiceOfStrategy(array: arrayJSON)
        
        
        if !Game.activate.recordsAdd.isEmpty {
            for i in Game.activate.recordsAdd {
                
                
                
                let q = i.question
                let a = i.answers
                let r = i.rightAnswer
                let i = i.id
                
                let question: QuestionJSON = .init(question: q, answer: a, rightAnswer: r, id: i)
                
//                question?.question = q
//                question?.answer = a
//                question?.rightAnswer = r
//                question?.id = i
                
                self.question?.append(question)
            }
        }

                if !Game.activate.question.isEmpty {
                    question?.append(contentsOf: Game.activate.question)

        //            numberOfQuestions = question!.count
                }
        
        
        numberOfQuestions = question!.count


        
        let indexQuestion = question![0]
        
        questionTextLabel.text = indexQuestion.question
        answerButton1.setTitle(indexQuestion.answer[0], for: .normal)
        answerButton2.setTitle(indexQuestion.answer[1], for: .normal)
        answerButton3.setTitle(indexQuestion.answer[2], for: .normal)
        answerButton4.setTitle(indexQuestion.answer[3], for: .normal)
        
    }
    
    func setupQuestionAfterAnswer() {
        
        let indexQuestion = question![index]
        
        questionTextLabel.text = indexQuestion.question
        answerButton1.setTitle(indexQuestion.answer[0], for: .normal)
        answerButton2.setTitle(indexQuestion.answer[1], for: .normal)
        answerButton3.setTitle(indexQuestion.answer[2], for: .normal)
        answerButton4.setTitle(indexQuestion.answer[3], for: .normal)
        
    }
    
    func responseCheck(number: Int) {
        
        let question = self.question![index]
        
        if index == (self.question!.count - 1) && question.answer[number] == question.rightAnswer {
            index = 0
            rightQestion += 1
            Game.activate.gameSession?.currentNumber.value += 1
            endGame()
        } else if question.answer[number] == question.rightAnswer {
            index += 1
            Game.activate.gameSession?.currentNumber.value += 1
            rightQestion += 1
            setupQuestionAfterAnswer()
        } else {
            index = 0
            endGame()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestion()
        
        Game.activate.gameSession?.currentNumber.addObserver(self, options: [.new, .initial], closure: { [weak self] (currentNumber, _) in
            let textInt = Game.activate.gameSession?.currentNumber.value ?? 0
            let percent = String(Double(self!.rightQestion) / Double(self!.question!.count) * 100)
            self!.infoButton.text = "Номер вопроса: \(textInt + 1) из \(self!.question?.count ?? 0), \n% правильных ответов: \(percent)"
            })
        
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
        self.gameDelegate?.updateFunc(number: numberOfQuestions, right: rightQestion)
        self.dismiss(animated: true, completion: nil)
    }
}


