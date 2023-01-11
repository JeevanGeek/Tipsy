//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Jeevan Chandra Joshi on 11/01/23.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingLabel: UILabel!

    var result = "0.0"
    var tip = 10
    var split = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingLabel.text = "Split between \(split) people, with \(tip)% tip."
    }

    @IBAction func recalculate(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
