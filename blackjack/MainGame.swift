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
    
    
    
    var cardArray : [String] = ["clubs_ace", "clubs_2", "clubs_3", "clubs_4", "clubs_5", "clubs_6", "clubs_7", "clubs_8", "clubs_9", "clubs_10", "clubs_jack", "clubs_queen", "clubs_king","diamonds_ace", "diamonds_2", "diamonds_3", "diamonds_4", "diamonds_5", "diamonds_6", "diamonds_7", "diamonds_8", "diamonds_9", "diamonds_10", "diamonds_jack", "diamonds_queen", "diamonds_king", "spades_ace", "spades_2", "spades_3", "spades_4", "spades_5", "spades_6", "spades_7", "spades_8", "spades_9", "spades_10", "spades_jack", "spades_queen", "spades_king", "hearts_ace", "hearts_2", "hearts_3", "hearts_4", "hearts_5", "hearts_6", "hearts_7", "hearts_8", "hearts_9", "hearts_10", "hearts_jack", "hearts_queen", "hearts_king"]
    var noNoArray : [Int] = []
    var acceptable = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dealButton(_ sender: Any) {
        var rand = Int.random(in: 0...51)
        dCard1.image = UIImage(named: cardArray[rand])
        dCard2.image = UIImage(named: "backofcard")
        noNoArray.append(rand)
        while acceptable == false {
            var check = true
            rand = Int.random(in: 0...51)
            for items in noNoArray {
                if items == rand {
                    check = false
                }
            }
            if check == true {
                acceptable = true
                uCard1.image = UIImage(named: cardArray[rand])
                noNoArray.append(rand)
            }
        }
        acceptable = false
        while acceptable == false {
            var check = true
            rand = Int.random(in: 0...51)
            for items in noNoArray {
                if items == rand {
                    check = false
                }
            }
            if check == true {
                acceptable = true
                uCard2.image = UIImage(named: cardArray[rand])
            }
        }
        
        
    }
    
    @IBAction func hitButton(_ sender: Any) {
    }
    
    @IBAction func standButton(_ sender: Any) {
    }
    
    @IBAction func betButton(_ sender: Any) {
    }
    
}
