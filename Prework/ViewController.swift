//
//  ViewController.swift
//  Prework
//
//  Created by Nikita Acharya on 12/28/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billField.becomeFirstResponder()
        let locale = Locale.current
        let currencySymbol = String(locale.currencySymbol!)
        tipLabel.text = String(format: "\(currencySymbol)%.2f", 0.00)
        totalLabel.text = String(format: "\(currencySymbol )%.2f", 0.00)
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get the initial bill amount
        let bill = Double(billField.text!) ?? 0
        
        let locale = Locale.current
        let currencySymbol = String(locale.currencySymbol!)
        if bill == 0{
            tipLabel.text = String(format: "\(currencySymbol)%.2f", 0.00)
            totalLabel.text = String(format: "\(currencySymbol )%.2f", 0.00)
        }else{
            // Calculate the tip and total
            let tipPercentages = [0.15, 0.18, 0.20]
            let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
            let total = bill + tip
            
            // Update the tip and total labels
           
            
            tipLabel.text = String(format: "\(currencySymbol)%.2f", locale: locale, tip)
            totalLabel.text = String(format: "\(currencySymbol )%.2f", locale: locale, total)
        }
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
}

