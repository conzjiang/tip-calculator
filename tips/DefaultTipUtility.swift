//
//  DefaultTipUtility.swift
//  tips
//
//  Created by constance_jiang on 4/27/16.
//  Copyright © 2016 constance_jiang. All rights reserved.
//

import Foundation

class DefaultValuesUtility {
  static let TIP_INDEX_KEY = "default_tip_index"
  static let BILL_AMOUNT_KEY = "default_bill_amount"
  static let PARTY_COUNT_KEY = "default_party_count"

  static func getDefaultTipIndex() -> Int {
    return getSavedIntegerForKey(TIP_INDEX_KEY)
  }

  static func getDefaultBillAmount() -> Double {
    return getSavedDoubleForKey(BILL_AMOUNT_KEY)
  }

  static func getDefaultPartyCount() -> Int {
    return getSavedIntegerForKey(PARTY_COUNT_KEY)
  }

  static func saveTipIndex(index: Int) {
    saveIntegerToLocalStorage(index, withKey: TIP_INDEX_KEY)
  }

  static func saveBillAmount(billAmount: Double) {
    saveDoubleToLocalStorage(billAmount, withKey: BILL_AMOUNT_KEY)
  }

  static func savePartyCount(partyCount: Int) {
    saveIntegerToLocalStorage(partyCount, withKey: PARTY_COUNT_KEY)
  }

  static private func getSavedIntegerForKey(key: String) -> Int {
    // returns 0 if key does not exist
    let defaults = NSUserDefaults.standardUserDefaults()
    let savedInteger = defaults.integerForKey(key)
    return savedInteger
  }

  static private func getSavedDoubleForKey(key: String) -> Double {
    let defaults = NSUserDefaults.standardUserDefaults()
    let savedDouble = defaults.doubleForKey(key)
    return savedDouble
  }

  static private func saveIntegerToLocalStorage(integer: Int, withKey key: String) {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setInteger(integer, forKey: key)
    defaults.synchronize()
  }

  static private func saveDoubleToLocalStorage(double: Double, withKey key: String) {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setDouble(double, forKey: key)
    defaults.synchronize()
  }
}
