//
//  ColorTheme.swift
//  tippy
//
//  Created by ruthie_berman on 8/18/17.
//  Copyright © 2017 ruthie_berman. All rights reserved.
//

import Foundation
import UIKit

class ColorTheme {
  static let sharedInstance = ColorTheme()
  var currentColor: UIColor
  var currentColorIndex: Int
  var color0 = UIColor(hue: 0.958, saturation: 0.83, brightness: 1.0, alpha: 1.0)
  var color1 = UIColor(hue: 0.594, saturation: 0.77, brightness: 1.0, alpha: 1.0)
  var color2 = UIColor(hue: 0.472, saturation: 0.78, brightness: 1.0, alpha: 1.0)
  var color3 = UIColor(hue: 0.431, saturation: 0.87, brightness: 0.92, alpha: 1.0)
  var color4 = UIColor(hue: 0.431, saturation: 0.0, brightness: 0.72, alpha: 1.0)

  init() {
    self.currentColor = self.color0
    self.currentColorIndex = 0
  }

  func setCurrentColor(colorIndex: Int) {
    self.currentColorIndex = colorIndex
    switch colorIndex {
    case 0:
      currentColor = color0
    case 1:
      currentColor = color1
    case 2:
      currentColor = color2
    case 3:
      currentColor = color3
    case 4:
      currentColor = color4
    default:
      print("Not a defined color")
    }
  }

}
