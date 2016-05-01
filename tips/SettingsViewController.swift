//
//  SettingsViewController.swift
//  tips
//
//  Created by constance_jiang on 4/27/16.
//  Copyright © 2016 constance_jiang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  @IBOutlet weak var defaultTipControl: UISegmentedControl!

  override func viewDidLoad() {
    super.viewDidLoad()
    defaultTipControl.selectedSegmentIndex = DefaultValuesUtility.getDefaultTipIndex()
  }

  @IBAction func onValueChanged(sender: AnyObject) {
    let defaultTipIndex = defaultTipControl.selectedSegmentIndex
    DefaultValuesUtility.saveTipIndex(defaultTipIndex)
  }
}
