//
//  MainGame.swift
//  blackjack
//
//  Created by JOHN BRUCKER on 11/30/21.
//

import UIKit

class MainGame: UIViewController {
    
    
    @IBOutlet weak var dealerLabel: UILabel!
    
    
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var dCard1: UIImageView!
    @IBOutlet weak var dCard2: UIImageView!
    @IBOutlet weak var dCard3: UIImageView!
    @IBOutlet weak var dCard4: UIImageView!
    @IBOutlet weak var dCard5: UIImageView!
    @IBOutlet weak var dCard6: UIImageView!
    
    
    @IBOutlet weak var uCard1: UIImageView!
    @IBOutlet weak var uCard2: UIImageView!
    @IBOutlet weak var uCard3: UIImageView!
    @IBOutlet weak var uCard4: UIImageView!
    @IBOutlet weak var uCard5: UIImageView!
    @IBOutlet weak var uCard6: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dealButton(_ sender: Any) {
    }
    
    @IBAction func hitButton(_ sender: Any) {
    }
    
    @IBAction func standButton(_ sender: Any) {
    }
    
    @IBAction func betButton(_ sender: Any) {
    }
    
}
