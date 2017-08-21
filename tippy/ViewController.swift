//
//  ViewController.swift
//  tippy
//
//  Created by ruthie_berman on 8/16/17.
//  Copyright © 2017 ruthie_berman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var tipControl: UISegmentedControl!
  @IBOutlet weak var segmentControl: UISegmentedControl!
  let tipValues = TipValues.sharedInstance
  let colorTheme = ColorTheme.sharedInstance
  let defaults = UserDefaults.standard

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    checkDefaults()
    setSegmentControlTitles()
    updateColorTheme()
    calculateTip(self)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func onTap(_ sender: Any) {
    view.endEditing(true)
  }

  @IBAction func calculateTip(_ sender: Any) {
    limitBillTextField()

    let tipPercentages = tipValues.getTipDecimals()
    let bill = Double(billField.text!) ?? 0
    let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
    let total = bill + tip

    tipLabel.text = String(format: "$%.2f", tip)
    totalLabel.text = String(format: "$%.2f", total)

    defaults.set(billField.text!, forKey: "bill")
    defaults.synchronize()
  }

  func setSegmentControlTitles() {
    let titles = tipValues.getTipTitles()
    for i in 0...2 {
      segmentControl.setTitle(titles[i], forSegmentAt: i)
    }
  }

  func limitBillTextField() {
    let maxLength = 5
    if (billField.text!.characters.count > maxLength) {
      billField.deleteBackward()
    }
  }

  func updateColorTheme() {
    segmentControl.tintColor = colorTheme.currentColor
  }

  func checkDefaults() {
    for (key, value) in defaults.dictionaryRepresentation() {
      switch key {
      case "tip_0":
        tipValues.tip0 = value as! Int
      case "tip_1":
        tipValues.tip1 = value as! Int
      case "tip_2":
        tipValues.tip2 = value as! Int
      case "color_theme":
        colorTheme.setCurrentColor(colorIndex: value as! Int)
      case "bill":
        let saveOn = defaults.bool(forKey: "save_last_bill")
        if saveOn {
            billField.text = value as? String
        }
      default:
        continue
      }
    }
  }
}



