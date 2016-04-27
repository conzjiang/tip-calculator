//
//  DefaultTipUtility.swift
//  tips
//
//  Created by constance_jiang on 4/27/16.
//  Copyright © 2016 constance_jiang. All rights reserved.
//

import Foundation

class DefaultTipUtility {
  static let DEFAULT_TIP_INDEX_KEY = "default_tip_index"

  static func getDefaultTipIndex() -> Int {
    // returns 0 if key does not exist
    let defaults = NSUserDefaults.standardUserDefaults()
    let index = defaults.integerForKey(DEFAULT_TIP_INDEX_KEY)
    return index
  }

  static func saveToLocalStorage(defaultTipIndex: Int) {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setInteger(defaultTipIndex, forKey: DEFAULT_TIP_INDEX_KEY)
    defaults.synchronize()
  }
}
