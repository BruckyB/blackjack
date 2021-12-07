//
//  RulesScreen.swift
//  blackjack
//
//  Created by JOHN BRUCKER on 11/30/21.
//

import UIKit

class RulesScreen: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        if DataTransfer.darkMode == true {
            self.view.backgroundColor = UIColor.black
            textView.textColor = UIColor.white
            textView.backgroundColor = UIColor.black 
        textView.text = "CHICAGO RULES:\n1. Aces are worth 1\n2. Dealer can deal up to 17\n3. A player is allowed to hit unless they reach 21, which the player has got blackjack\n3b. If the dealer busts (over 21), the player wins.\n3c. If the player busts, the dealer wins."
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
