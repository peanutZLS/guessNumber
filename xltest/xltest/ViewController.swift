//
//  ViewController.swift
//  xltest
//
//  Created by 郭家宇 on 2023/7/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessNumber: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    var max = 100
    var min = 1
    var guessNum = Int.random(in: 2...99)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        print("\(guessNum)")
        
        
    }
    @IBAction func newgame(_ sender: Any) {
        max = 100
        min = 1
        var guessNum = Int.random(in: 2...99)
        guessNumber.text = ""
        textLabel.text = "please input  1 ~ 100 "
        guessNumber.placeholder = ""
        
    }
    @IBAction func hint(_ sender: Any) {
        guessNumber.placeholder = "\(guessNum)"
    }
    @IBAction func guess(_ sender: Any) {
        var guessText = guessNumber.text!
        var GuessNumber = Int(guessText)
        if GuessNumber == nil {
            textLabel.text = "please input \(min) ~ \(max)"
        }else if GuessNumber! > max {
            textLabel.text = "Too high!! please input  1 ~ 100"
        }else if GuessNumber! < min {
            textLabel.text = "Too low!! please input  1 ~ 100"
        }else if GuessNumber! >= min && GuessNumber! < guessNum {
            min = GuessNumber!
            textLabel.text = "please input  \(min) ~ \(max)"
        }else if GuessNumber! <= max && GuessNumber! > guessNum {
            max = GuessNumber!
            textLabel.text = "please input  \(min) ~ \(max)"
        }else{
            textLabel.text = "Congratulations"
        }
        print("\(max), \(min)")
    }
    

}

