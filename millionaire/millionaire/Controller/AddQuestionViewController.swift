//
//  AddQuestionViewController.swift
//  millionaire
//
//  Created by Evgeny Kolesnik on 07.06.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController {
    
    private let questionCaretaker: AddQuestionCaretaker = .init()

    @IBOutlet weak var questionLabel: UITextField!
    @IBOutlet weak var answer1Label: UITextField!
    @IBOutlet weak var answer2Label: UITextField!
    @IBOutlet weak var answer3Label: UITextField!
    @IBOutlet weak var answer4Label: UITextField!
    @IBOutlet weak var rightAnswer: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func addButton(_ sender: Any) {
        
        if questionLabel.text != nil && answer1Label.text != nil && answer2Label.text != nil && answer3Label.text != nil && answer4Label.text != nil && rightAnswer.text != nil {
            
            let arrayJSON = Bundle.main.decode([QuestionJSON].self, from: "question.json") + Game.activate.question

            let question = questionLabel.text!
            let answer = ["\(answer1Label.text ?? "")", "\(answer2Label.text ?? "")", "\(answer3Label.text ?? "")", "\(answer4Label.text ?? "")"]
            let rightAnswer1 = rightAnswer.text!
            let id = arrayJSON.count + 1
            
            let addQuestion = QuestionJSON(question: question, answer: answer, rightAnswer: rightAnswer1, id: id)
            Game.activate.question.append(addQuestion)
            
            var addQuestion1 = AddQuestion()
            
            addQuestion1.question = question
            addQuestion1.answers = answer
            addQuestion1.rightAnswer = rightAnswer1
            addQuestion1.id = id
            
            Game.activate.questionAdd.append(addQuestion1)
            questionCaretaker.save(records: Game.activate.questionAdd + Game.activate.recordsAdd)

            self.dismiss(animated: true, completion: nil)
            
        }
    }
    

}
