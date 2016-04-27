//
//  TipViewController.swift
//  tips
//
//  Created by constance_jiang on 4/27/16.
//  Copyright © 2016 constance_jiang. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
  @IBOutlet weak var tipControl: UISegmentedControl!
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var totalLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    tipLabel.text = "$0.00"
    totalLabel.text = "$0.00"
  }


  @IBAction func onEditingChanged(sender: AnyObject) {
    let tipPercentages = [0.18, 0.2, 0.22]
    let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

    let billAmount = NSString(string: billField.text!).doubleValue
    let tip = billAmount * tipPercentage
    let total = billAmount + tip

    tipLabel.text = String(format: "$%.2f", tip)
    totalLabel.text = String(format: "$%.2f", total)
  }

  @IBAction func onTap(sender: AnyObject) {
    view.endEditing(true)
  }
}

