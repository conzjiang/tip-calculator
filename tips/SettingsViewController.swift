//
//  SettingsViewController.swift
//  tips
//
//  Created by constance_jiang on 4/27/16.
//  Copyright © 2016 constance_jiang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  let DEFAULT_TIP_INDEX_KEY = "default_tip_index"

  @IBOutlet weak var defaultTipControl: UISegmentedControl!

  override func viewDidLoad() {
    super.viewDidLoad()
    defaultTipControl.selectedSegmentIndex = getDefaultTipIndex()
  }

  @IBAction func onValueChanged(sender: AnyObject) {
    let defaultTipIndex = defaultTipControl.selectedSegmentIndex
    saveToLocalStorage(defaultTipIndex)
  }

  func saveToLocalStorage(defaultTipIndex: Int) -> Void {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setInteger(defaultTipIndex, forKey: DEFAULT_TIP_INDEX_KEY)
    defaults.synchronize()
  }

  func getDefaultTipIndex() -> Int {
    // returns 0 if key does not exist
    let defaults = NSUserDefaults.standardUserDefaults()
    let index = defaults.integerForKey(DEFAULT_TIP_INDEX_KEY)
    return index
  }

}
