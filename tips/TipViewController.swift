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

    setDefaultValues()
    billField.becomeFirstResponder()
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    tipControl.selectedSegmentIndex = DefaultValuesUtility.getDefaultTipIndex()
    updateTipAndTotal()
  }

  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    DefaultValuesUtility.saveBillAmount(billFieldDoubleValue())
    DefaultValuesUtility.savePartyCount(Int(partyCountField.text!)!)
  }

  @IBAction func onEditingChanged(sender: AnyObject) {
    updateTipAndTotal()
  }

  @IBAction func onTap(sender: AnyObject) {
    view.endEditing(true)
  }

  func textFieldDidBeginEditing(textField: UITextField) {
    textField.selectAll(nil)
  }

  func textFieldDidEndEditing(textField: UITextField) {
    guard textField == billField else {
      return
    }

    // normalize bill amount to $xx.xx format with two decimal places
    // ex) 10 -> 10.00
    textField.text = convertDoubleToString(billFieldDoubleValue(), addDollarSign: false)
  }

  private func setDefaultValues() {
    let defaultBillAmount = DefaultValuesUtility.getDefaultBillAmount()
    let defaultPartyCount = DefaultValuesUtility.getDefaultPartyCount()
    billField.text = convertDoubleToString(defaultBillAmount, addDollarSign: false)
    partyCountField.text = String(defaultPartyCount)
  }

  private func updateTipAndTotal() {
    let billAmount = billFieldDoubleValue()
    let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
    let totalTip = billAmount * tipPercentage
    let totalBill = billAmount + totalTip

    tipLabel.text = convertDoubleToString(amountPerPerson(totalTip), addDollarSign: true)
    totalLabel.text = convertDoubleToString(amountPerPerson(totalBill), addDollarSign: true)
  }

  private func amountPerPerson(amount: Double) -> Double {
    let partyCount = NSString(string: partyCountField.text!).doubleValue

    guard partyCount > 0 else {
      return 0
    }

    return amount / partyCount
  }

  private func convertDoubleToString(amount: Double, addDollarSign: Bool) -> String {
    var formatString = "%.2f"

    if addDollarSign {
      formatString = "$%.2f"
    }

    return String(format: formatString, amount)
  }

  private func billFieldDoubleValue() -> Double {
    return NSString(string: billField.text!).doubleValue
  }
}

