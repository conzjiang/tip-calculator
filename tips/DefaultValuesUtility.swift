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
  static let DEFAULT_BILL_AMOUNT = 10.0
  static let DEFAULT_PARTY_COUNT = 1

  static func getDefaultTipIndex() -> Int {
    return getSavedIntegerForKey(TIP_INDEX_KEY)
  }

  static func getDefaultBillAmount() -> Double {
    let billAmount = getSavedDoubleForKey(BILL_AMOUNT_KEY)

    if billAmount == 0 {
      return DEFAULT_BILL_AMOUNT
    }

    return billAmount
  }

  static func getDefaultPartyCount() -> Int {
    let partyCount = getSavedIntegerForKey(PARTY_COUNT_KEY)

    if partyCount == 0 {
      return DEFAULT_PARTY_COUNT
    }

    return partyCount
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
