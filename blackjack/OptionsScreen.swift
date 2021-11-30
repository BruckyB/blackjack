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
    
    @IBOutlet weak var acesLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func darkModeSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func moneySwitch(_ sender: UISwitch) {
    }
    
    @IBAction func acesSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func setButton(_ sender: Any) {
    }
}
