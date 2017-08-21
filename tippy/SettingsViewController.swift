//
//  SettingsViewController.swift
//  tippy
//
//  Created by ruthie_berman on 8/17/17.
//  Copyright © 2017 ruthie_berman. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  @IBOutlet weak var tipPercentageField0: UITextField!
  @IBOutlet weak var tipPercentageField1: UITextField!
  @IBOutlet weak var tipPercentageField2: UITextField!
  let tipValues = TipValues.sharedInstance

  @IBOutlet weak var settingsBackground0: UIView!
  @IBOutlet weak var settingsBackground1: UIView!
  @IBOutlet weak var color0: UIView!
  @IBOutlet weak var color1: UIView!
  @IBOutlet weak var color2: UIView!
  @IBOutlet weak var color3: UIView!
  @IBOutlet weak var color4: UIView!
  let colorTheme = ColorTheme.sharedInstance

  @IBOutlet weak var saveLastBill: UISwitch!
  let defaults = UserDefaults.standard

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    populateTipFields()
    populateColorPickerColors()
    updateColorTheme()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let saveOn = defaults.bool(forKey: "save_last_bill")
    saveLastBill.setOn(saveOn, animated: false)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    saveDefaults()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func saveDefaults() {
    print("SaveDefaults")
    defaults.set(tipValues.tip0, forKey: "tip_0")
    defaults.set(tipValues.tip1, forKey: "tip_1")
    defaults.set(tipValues.tip2, forKey: "tip_2")
    defaults.set(colorTheme.currentColorIndex, forKey: "color_theme")
    defaults.synchronize()
  }

  func populateTipFields() {
    let tips = tipValues.getTipTitlesNoPercent()
    tipPercentageField0.text = tips[0]
    tipPercentageField1.text = tips[1]
    tipPercentageField2.text = tips[2]
  }

  @IBAction func onTap(_ sender: Any) {
    view.endEditing(true)
    populateTipFields()
  }

  @IBAction func tipValueChanged0(_ sender: Any) {
    limitPercentageTextField(field: tipPercentageField0)
    updatePercentageValue(field: tipPercentageField0, tipIndex: 0)
  }

  @IBAction func tipValueChanged1(_ sender: Any) {
    limitPercentageTextField(field: tipPercentageField1)
    updatePercentageValue(field: tipPercentageField1, tipIndex: 1)
  }

  @IBAction func tipValueChanged2(_ sender: Any) {
    limitPercentageTextField(field: tipPercentageField2)
    updatePercentageValue(field: tipPercentageField2, tipIndex: 2)
  }

  func limitPercentageTextField(field: UITextField) {
    let maxLength = 2
    if (field.text!.characters.count > maxLength) {
      field.deleteBackward()
    }
  }

  func updatePercentageValue(field: UITextField, tipIndex: Int){
    let newTipValue = (field.text?.isEmpty)! ? 0 : Int(field.text!)!
    tipValues.setTip(newTip: newTipValue, tipIndex: tipIndex)
    saveDefaults()
  }

  func populateColorPickerColors() {
    color0.backgroundColor = colorTheme.color0
    color1.backgroundColor = colorTheme.color1
    color2.backgroundColor = colorTheme.color2
    color3.backgroundColor = colorTheme.color3
    color4.backgroundColor = colorTheme.color4
  }

  func updateColorTheme() {
    settingsBackground0.backgroundColor = colorTheme.currentColor
    settingsBackground1.backgroundColor = colorTheme.currentColor
    saveDefaults()
  }

  @IBAction func color0Tapped(_ sender: Any) {
    colorTheme.setCurrentColor(colorIndex: 0)
    updateColorTheme()
  }

  @IBAction func color1Tapped(_ sender: Any) {
    colorTheme.setCurrentColor(colorIndex: 1)
    updateColorTheme()
  }

  @IBAction func color2Tapped(_ sender: Any) {
    colorTheme.setCurrentColor(colorIndex: 2)
    updateColorTheme()
  }

  @IBAction func color3Tapped(_ sender: Any) {
    colorTheme.setCurrentColor(colorIndex: 3)
    updateColorTheme()
  }

  @IBAction func color4Tapped(_ sender: Any) {
    colorTheme.setCurrentColor(colorIndex: 4)
    updateColorTheme()
  }

  @IBAction func saveLastBillSwitchValueChanged(_ sender: Any) {
    defaults.set(saveLastBill.isOn, forKey: "save_last_bill")
    defaults.synchronize()
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
}
