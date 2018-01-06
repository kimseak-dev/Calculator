//
//  ViewController.swift
//  Caculator
//
//  Created by kimseak on 1/2/18.
//  Copyright © 2018 StandFord Unversity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
       
        if(userIsTheMiddleOfTyping){
             let textCurrentlyInDisplay = display.text!
             display!.text = textCurrentlyInDisplay + digit
        }else{
            display!.text = digit
            userIsTheMiddleOfTyping = true
        }
    }
    
    var displayValue: Double {
        get{
          return Double(display.text!)!
        }
        set{
            display?.text = String(newValue)
        }
    }
    
    private var brain:CalculatorBrain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle{
            switch mathematicalSymbol{
            case "π":
                display!.text = String(Double.pi)
            case "√":
                //let operand = Double(display!.text!)
                //display!.text = String(sqrt(operand!))
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }

        
    }
    
}

