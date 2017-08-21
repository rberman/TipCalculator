//
//  TipValues.swift
//  tippy
//
//  Created by ruthie_berman on 8/17/17.
//  Copyright © 2017 ruthie_berman. All rights reserved.
//

import Foundation
class TipValues {
  static let sharedInstance = TipValues()
  var tip0: Int
  var tip1: Int
  var tip2: Int

  init(tip0: Int = 18, tip1: Int = 20, tip2: Int = 22) {
    self.tip0 = tip0
    self.tip1 = tip1
    self.tip2 = tip2
  }

  func setTip(newTip: Int, tipIndex: Int) {
    switch tipIndex {
    case 0:
      tip0 = newTip
    case 1:
      tip1 = newTip
    case 2:
      tip2 = newTip
    default:
      print("There are only 3 tip percentages")
    }
  }

  func getTipTitles() -> Array<String> {
    let tips = [
      "\(tip0)%",
      "\(tip1)%",
      "\(tip2)%",
    ]
    return tips
  }

  func getTipTitlesNoPercent() -> Array<String> {
    let tips = [
      "\(tip0)",
      "\(tip1)",
      "\(tip2)",
    ]
    return tips
  }

  func getTipPercentages() -> Array<Int> {
    let tips = [tip0, tip1, tip2]
    return tips
  }

  func getTipDecimals() -> Array<Double> {
    let tips = [
      Double(tip0) * 0.01,
      Double(tip1) * 0.01,
      Double(tip2) * 0.01,
      ]
    return tips
  }
}
