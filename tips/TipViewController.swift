//
//  TipViewController.swift
//  tips
//
//  Created by constance_jiang on 4/27/16.
//  Copyright © 2016 constance_jiang. All rights reserved.
//

import UIKit

class TipViewController: UIViewController, UITextFieldDelegate {
  let tipPercentages = [0.18, 0.2, 0.22]

  @IBOutlet weak var tipControl: UISegmentedControl!
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var partyCountField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    billField.delegate = self
    partyCountField.delegate = self
    billField.becomeFirstResponder()
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    tipControl.selectedSegmentIndex = DefaultValuesUtility.getDefaultTipIndex()
    updateTipAndTotal()
  }

  func textFieldDidBeginEditing(textField: UITextField) {
    textField.selectAll(nil)
  }

  @IBAction func onEditingChanged(sender: AnyObject) {
    updateTipAndTotal()
  }

  @IBAction func onTap(sender: AnyObject) {
    view.endEditing(true)
  }

  func updateTipAndTotal() {
    let billAmount = NSString(string: billField.text!).doubleValue
    let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
    let totalTip = billAmount * tipPercentage
    let totalBill = billAmount + totalTip

    tipLabel.text = String(format: "$%.2f", amountPerPerson(totalTip))
    totalLabel.text = String(format: "$%.2f", amountPerPerson(totalBill))
  }

  func amountPerPerson(amount: Double) -> Double {
    let partyCount = NSString(string: partyCountField.text!).doubleValue

    guard partyCount > 0 else {
      return 0
    }

    return amount / partyCount
  }
}

