//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var markProgressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    var marks = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = quizBrain.quizQuestions[0].q
        questionText.textColor = #colorLiteral(red: 1, green: 0.9825222212, blue: 0.969447563, alpha: 1)
        markProgressBar.progress = 0.0
    }

    @IBAction func ButtonPressed(_ sender: UIButton) {
        
        let check = quizBrain.checkans(sender.currentTitle!)
        if(check == true)
        {
            sender.backgroundColor = UIColor.green
            marks+=1
        }
        else
        {
            sender.backgroundColor = UIColor.red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(update), userInfo: nil, repeats: false)
    }
    @objc func update()
    {
        if (quizBrain.questionNumber<11)
        {
            quizBrain.questionNumber += 1
            questionText.text = quizBrain.getQuestionText()
            markProgressBar.progress = quizBrain.getProgress()
        }
        else if(quizBrain.questionNumber>11)
        {
            questionText.text = "Your score is \(marks)"
        }
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
 
}

