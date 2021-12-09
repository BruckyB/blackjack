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
    
}


class ViewController: UIViewController {
    @IBOutlet weak var blackjackLabel: UILabel!
    @IBOutlet weak var playButCol: UIButton!
    @IBOutlet weak var statsButCol: UIButton!
    @IBOutlet weak var rulesButCol: UIButton!
    @IBOutlet weak var optButCol: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        if DataTransfer.darkMode == true {
            self.view.backgroundColor = UIColor.black
            blackjackLabel.textColor = UIColor.white
            playButCol.backgroundColor = UIColor.white
            statsButCol.backgroundColor = UIColor.white
            rulesButCol.backgroundColor = UIColor.white
            optButCol.backgroundColor = UIColor.white
        } else {
            self.view.backgroundColor = UIColor.white
            blackjackLabel.textColor = UIColor.black 
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        // Do any additional setup after loading the view.
    

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

