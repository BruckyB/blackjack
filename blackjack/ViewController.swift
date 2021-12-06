//
//  ViewController.swift
//  blackjack
//
//  Created by JOHN BRUCKER on 11/29/21.
//

// hello - Harrison
import UIKit
//john 
class DataTransfer {
    
    static var darkMode = false
    static var aces1 = false
    static var infMoney = false
    static var startingAmount = 100
    static var win = false
    static var bust = false
    
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playButton(_ sender: Any) {
        performSegue(withIdentifier: "segueToGame", sender: nil)
    }
    
    @IBAction func statsButton(_ sender: Any) {
        performSegue(withIdentifier: "segueToStats", sender: nil)
    }
    
    @IBAction func rulesButton(_ sender: Any) {
        performSegue(withIdentifier: "segueToRules", sender: nil)
    }
    
    @IBAction func optionsButton(_ sender: Any) {
        performSegue(withIdentifier:"segueToOptions", sender: nil)
    }
    
    
}

