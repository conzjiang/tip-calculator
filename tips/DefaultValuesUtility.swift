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
  static let LAST_OPENED_DATE_KEY = "last_opened_date"
  static let DEFAULT_BILL_AMOUNT = 0.0
  static let DEFAULT_PARTY_COUNT = 1
  // 10 minutes in seconds
  static let EXPIRED_TIME_THRESHOLD: Double = 60 * 10
  var sharedInstance: DefaultValuesUtility!



  static func getDefaultTipIndex() -> Int {
    return getSavedIntegerForKey(TIP_INDEX_KEY)
  }

  static func getDefaultBillAmount() -> Double {
    let billAmount = getSavedDoubleForKey(BILL_AMOUNT_KEY)

    if billAmount == 0 || shouldClearSavedBillAmount() {
      return DEFAULT_BILL_AMOUNT
    }

    return billAmount
  }

  static func getDefaultPartyCount() -> Int {
    let partyCount = getSavedIntegerForKey(PARTY_COUNT_KEY)

    if partyCount == 0 || shouldClearSavedBillAmount() {
      return DEFAULT_PARTY_COUNT
    }

    return partyCount
  }

  static func getLastOpenedDate() -> NSDate {
    let defaults = NSUserDefaults.standardUserDefaults()
    let lastOpenedDate = defaults.objectForKey(LAST_OPENED_DATE_KEY)

    if lastOpenedDate == nil {
      return NSDate()
    }

    return lastOpenedDate! as! NSDate
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

  static func saveLastOpenedDate() {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject(NSDate(), forKey: LAST_OPENED_DATE_KEY)
    defaults.synchronize()
  }

  static private func getSavedIntegerForKey(key: String) -> Int {
    // returns 0 if key does not exist
    let defaults = NSUserDefaults.standardUserDefaults()
    return defaults.integerForKey(key)
  }

  static private func getSavedDoubleForKey(key: String) -> Double {
    let defaults = NSUserDefaults.standardUserDefaults()
    return defaults.doubleForKey(key)
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

  static private func shouldClearSavedBillAmount() -> Bool {
    let lastOpenedDate = getLastOpenedDate()
    return lastOpenedDate.timeIntervalSinceNow * -1.0 > EXPIRED_TIME_THRESHOLD
  }
}
