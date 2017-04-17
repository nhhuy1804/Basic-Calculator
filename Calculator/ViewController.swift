//
//  ViewController.swift
//  Calculator
//
//  Created by MrDummy on 4/17/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var performingMath = false
    var previousNumber:Double = 0;
    var operation = 0;

    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
            
        } else {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 12 && sender.tag != 17 {
            
            previousNumber = Double(label.text!)!
            
            if sender.tag == 13 {
                label.text = "*"
                
            } else if sender.tag == 14 {
                label.text = "/"
                
            } else if sender.tag == 15 {
                label.text = "+"
                
            } else if sender.tag == 16 {
                label.text = "-"
                
            }
            
            operation = sender.tag
            performingMath = true
            
        } else if sender.tag == 12 {
            label.text = ""
            numberOnScreen = 0;
            previousNumber = 0;
            operation = 0;
            
        } else if sender.tag == 17 {
            if operation == 13 {
                // Nhan
                label.text = String(previousNumber * numberOnScreen)
                
            } else if operation == 14 {
                // Chia
                label.text = String(previousNumber / numberOnScreen)
                
            } else if operation == 15 {
                // Cong
                label.text = String(previousNumber + numberOnScreen)
                
            } else if operation == 16 {
                // Tru
                label.text = String(previousNumber - numberOnScreen)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

