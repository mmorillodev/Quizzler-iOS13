//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let quiz = [
        ["Four + Two equal six.", "True"],
        ["Five - Three greater than one.", "True"],
        ["Three + Eight is less than ten.", "False"],
    ]
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
    }

    @IBAction func buttonClick(_ sender: UIButton) {
        paintQuestionLabel(sender.currentTitle == quiz[questionIndex][1])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500), execute: {
            self.updateIndex()
            self.updateQuestion()
            self.questionLabel.textColor = UIColor.white
        })
    }
    
    func paintQuestionLabel(_ isCorrect: Bool) {
        questionLabel.textColor = isCorrect ? UIColor.green : UIColor.red
    }
    
    func updateIndex() {
        if(questionIndex < quiz.count - 1) {
            questionIndex += 1
        } else {
            questionIndex = 0
        }
    }
    
    func updateQuestion() {
        questionLabel.text = quiz[questionIndex][0]
        progressBar.setProgress(Float(questionIndex)/Float(quiz.count), animated: true)
    }
}

