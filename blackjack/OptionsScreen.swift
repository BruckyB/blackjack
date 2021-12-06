//
//  OptionsScreen.swift
//  blackjack
//
//  Created by JOHN BRUCKER on 11/30/21.
//

import UIKit

class OptionsScreen: UIViewController {
    
    
    @IBOutlet weak var darkModeLabel: UILabel!
    
    @IBOutlet weak var infiniteMoneyLabel: UILabel!
    
    @IBOutlet weak var startingAmountLabel: UILabel!
        
    @IBOutlet weak var customStartAmount: UITextField!
    
    var textFieldStr = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func darkModeSwitch(_ sender: UISwitch) {
        if ((sender as AnyObject).isOn == true) {
            DataTransfer.darkMode = true
        } else {
            DataTransfer.darkMode = false
        }
        if DataTransfer.darkMode == true {
            // Turn on darkmode
            self.view.backgroundColor = UIColor.black
            darkModeLabel.backgroundColor = UIColor.white
        } else {
            print("Test")
            // Turn off darkmode
        }
    }
    
    @IBAction func moneySwitch(_ sender: UISwitch) {
        if((sender as AnyObject).isOn == true) {
            DataTransfer.infMoney = true
        } else {
            DataTransfer.infMoney = false
        }
            
    }
    
    
    @IBAction func setButton(_ sender: Any) {
        if customStartAmount.text != nil {
            textFieldStr = customStartAmount.text!
            if Int(textFieldStr) != nil {
                DataTransfer.startingAmount = Int(textFieldStr)!
                print(DataTransfer.startingAmount)

            } else {
               // print("Not good")
            }
            
        }
    }
}
