//
//  ViewController.swift
//  Project2
//
//  Created by Steven Vandegrift on 8/9/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var questionsAsked = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += [
            "estonia",
            "france",
            "germany",
            "ireland",
            "italy",
            "monaco",
            "nigeria",
            "poland",
            "russia",
            "spain",
            "uk",
            "us"
        ]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = "\(countries[correctAnswer].uppercased()) - Score:\(score)"
    }
    
    func resetGame(action: UIAlertAction! = nil){

        score = 0
        askQuestion()
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        questionsAsked += 1
        var title: String
        var message: String?
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct!"
            message = nil
        }else{
            title = "Wrong!"
            message = "The correct answer was \(correctAnswer + 1)"
        }
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let finalAc = UIAlertController(title: "\(title) Your final score is \(score)/10", message: nil, preferredStyle: .alert)
        finalAc.addAction(UIAlertAction(title: "Play Again", style: .default, handler: resetGame))
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        if questionsAsked == 10 {
            present(finalAc, animated: true)
        }else {
            present(ac, animated: true)
        }
        
    }
    
    
}

