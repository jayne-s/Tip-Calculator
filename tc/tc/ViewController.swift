//
//  ViewController.swift
//  tc
//
//  Created by Jayne Srinivas on 12/6/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var tipSegment: UISegmentedControl!
    @IBOutlet var total: UILabel!
    @IBOutlet var tipAmount: UILabel!
    @IBOutlet var resetButton: UIButton!
    let tipPercentages = [0.15,0.18,0.20,0.25]
    
   
    var stringConvert: Double? = 0
    var globalDouble: Double = 0
    var tip: Double = 0
    var totalAmount: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        finishTyping((Any).self)
        //tipAmount.text = "\(tip)"
        //total.text = "\(totalAmount)"
       // view.addSubview(total)
       //view.addSubview(tipAmount)
        self.view = view
        textField.isEnabled = true
    }

    
    @IBAction func finishTyping(_ sender: Any) {
        view.endEditing(true)
        calculateTip((Any).self)
    }
    
    @IBAction func calculateTip(_ sender: Any){
        
        stringConvert = Double(textField.text!)
        if stringConvert != nil{
            globalDouble = stringConvert!
        }
        
        tip = globalDouble * tipPercentages[tipSegment.selectedSegmentIndex]
        totalAmount = globalDouble + tip
        print(totalAmount)
        print(tip)
        var formatedTip = String(format: "%.2f", tip)
        var formatedTotal = String(format: "%.2f", totalAmount)
        tipAmount.text = "\(formatedTip)"
        total.text = "\(formatedTotal)"
        textField.isEnabled = false
    }
    
    @IBAction func resetProgram(_ sender: Any) {
        
        textField.text = " "
        textField.textColor = UIColor.systemGray
        tipAmount.text = "$0.00"
        total.text = "$0.00"
        textField.isEnabled = true
    
    }
    
}

