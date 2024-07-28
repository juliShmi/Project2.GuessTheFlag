//
//  ViewController.swift
//  Project2
//
//  Created by Iuliia Shmitko on 28/07/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var counter = 0
    
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 2
        button2.layer.borderWidth = 2
        button3.layer.borderWidth = 2
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        button1.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button2.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button3.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        askQuestion(action: nil)
        
    }
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
    
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Guess \(countries[correctAnswer].uppercased()) \t" + "Score: \(score)"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if correctAnswer == sender.tag {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! Correct answer is: \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        counter += 1
        
        if counter < 10 {
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {
            dismiss(animated: true, completion: nil)
            
            let final = UIAlertController(title: title, message: "Your final score is \(score)", preferredStyle: .alert)
            final.addAction(UIAlertAction(title: "Start again", style: .default, handler: askQuestion))
            present(final, animated: true)
            score = 0
            counter = 0
        }
    }
}

