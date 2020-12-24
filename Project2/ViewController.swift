//
//  ViewController.swift
//  Project2
//
//  Created by Pawel Wojcik on 24/12/2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var flags = [String]()
    var score = 0
    var correctAnswer = Int.random(in: 0...2)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
        
        flags += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 0.3
        button2.layer.borderWidth = 0.3
        button3.layer.borderWidth = 0.3
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        startGame()
    }

    func startGame(action: UIAlertAction! = nil) {
        
        flags.shuffle()
        title = flags[correctAnswer].uppercased()
        
        button1.setImage(UIImage(named: flags[0]), for: .normal)
        button2.setImage(UIImage(named: flags[1]), for: .normal)
        button3.setImage(UIImage(named: flags[2]), for: .normal)
    }

// USUNĄĆ REFRESH PÓŹNIEJ
    @objc func refresh() {
        startGame()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title = String()
        var message = String()
        
        if sender.tag == correctAnswer {
            title = "Correct"
            message = "You get 1 point."
            score += 1
        } else {
            title = "Wrong"
            message = "This is the flag of \(flags[correctAnswer].uppercased()). You lose 1 point."
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: message + " Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Next", style: .default, handler: startGame))
        present(ac, animated: true)
    }
    

}

