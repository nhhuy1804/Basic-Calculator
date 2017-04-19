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
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    @IBAction func numbers(_ sender: UIButton) {
        msg.isHidden = true
        if performingMath == true {
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
            
        } else {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            
        }
        btn1.isEnabled = true
        btn2.isEnabled = true
        btn3.isEnabled = true
        btn4.isEnabled = true
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        msg.isHidden = true
        if label.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 17 {
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
            btn1.isEnabled = false
            btn2.isEnabled = false
            btn3.isEnabled = false
            btn4.isEnabled = false
            
        } else if sender.tag == 12 {
            label.text = ""
            numberOnScreen = 0;
            previousNumber = 0;
            operation = 0;
            btn1.isEnabled = false
            btn2.isEnabled = false
            btn3.isEnabled = false
            btn4.isEnabled = false
            
        } else if sender.tag == 17 {
            if operation == 13 {
                // Nhan
                label.text = String(previousNumber * numberOnScreen)
                
            } else if operation == 14 {
                // Chia
                if numberOnScreen != 0 {
                    // chia so khac 0
                    label.text = String(previousNumber / numberOnScreen)
                    
                } else {
                    msg.isHidden = false
                    label.text = ""
                    numberOnScreen = 0;
                    previousNumber = 0;
                    operation = 0;
                    btn1.isEnabled = false
                    btn2.isEnabled = false
                    btn3.isEnabled = false
                    btn4.isEnabled = false
                    
                }
                
            } else if operation == 15 {
                // Cong
                label.text = String(previousNumber + numberOnScreen)
                
            } else if operation == 16 {
                // Tru
                label.text = String(previousNumber - numberOnScreen)
                
            }
        } else if sender.tag == 11 {
            // %
            label.text = String(numberOnScreen / 100)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        msg.isHidden = true
        btn1.isEnabled = false
        btn2.isEnabled = false
        btn3.isEnabled = false
        btn4.isEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

