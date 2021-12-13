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
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var textFieldStr = ""
    
    @IBOutlet weak var darkSwitch: UISwitch!
    
    @IBOutlet weak var infMonSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        if DataTransfer.darkMode == true {
            self.view.backgroundColor = UIColor.black
            darkModeLabel.textColor = UIColor.white
            infiniteMoneyLabel.textColor = UIColor.white
            startingAmountLabel.textColor = UIColor.black
            
        } else {
            errorLabel.textColor = UIColor.white
        }
        if DataTransfer.darkMode == true {
            darkSwitch.setOn(true, animated: true)
        }
        if DataTransfer.infMoney == true {
            infMonSwitch.setOn(true, animated: true)
        }
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
            darkModeLabel.textColor = UIColor.white
            infiniteMoneyLabel.textColor = UIColor.white
            startingAmountLabel.textColor = UIColor.white
            errorLabel.textColor = UIColor.black
        } else {
            // Turn off darkmode
            self.view.backgroundColor = UIColor.white
            darkModeLabel.textColor = UIColor.black
            infiniteMoneyLabel.textColor = UIColor.black
            startingAmountLabel.textColor = UIColor.white
            errorLabel.textColor = UIColor.white
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
                if DataTransfer.darkMode == true {
                    errorLabel.textColor = UIColor.white
                    errorLabel.text = "New Starting Amount Saved"
                } else {
                    errorLabel.textColor = UIColor.black
                    errorLabel.text = "New Starting Amount Saved"
                }
            } else {
                errorLabel.text = "Error: Invalid Number Entered"
                errorLabel.textColor = UIColor.red
     
            }
            
        }
    }
}
