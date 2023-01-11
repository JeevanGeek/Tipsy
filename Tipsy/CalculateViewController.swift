//
//  CalculateViewController.swift
//  Tipsy
//
//  Created by Jeevan Chandra Joshi on 11/01/23.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroTipButton: UIButton!
    @IBOutlet var tenTipButton: UIButton!
    @IBOutlet var twentyTipButton: UIButton!
    @IBOutlet var splitLabel: UILabel!

    var tip = 0.10
    var numberOfPeople = 3
    var totalBill = 0.0
    var finalResult = "0.0"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.result = finalResult
        resultViewController.tip = Int(tip * 100)
        resultViewController.split = numberOfPeople
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroTipButton.isSelected = false
        tenTipButton.isSelected = false
        twentyTipButton.isSelected = false
        sender.isSelected = true

        let buttonTitle = sender.currentTitle!
        let buttonNumber = Double(String(buttonTitle.dropLast()))
        tip = buttonNumber! / 100
    }

    @IBAction func stepperValue(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }

    @IBAction func calculate(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            totalBill = Double(bill)!
            let result = totalBill * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        performSegue(withIdentifier: "goToResult", sender: self)
    }
}
