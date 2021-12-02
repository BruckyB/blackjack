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
    @IBOutlet weak var userAmmount: UILabel!
    @IBOutlet weak var dealerAmmount: UILabel!
    
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
    var gameOver = false
    var userCount = 0
    var dealerCount = 0
    var currentUCard = 3
    
    
    var cardArray : [String] = ["clubs_ace", "clubs_2", "clubs_3", "clubs_4", "clubs_5", "clubs_6", "clubs_7", "clubs_8", "clubs_9", "clubs_10", "clubs_jack", "clubs_queen", "clubs_king","diamonds_ace", "diamonds_2", "diamonds_3", "diamonds_4", "diamonds_5", "diamonds_6", "diamonds_7", "diamonds_8", "diamonds_9", "diamonds_10", "diamonds_jack", "diamonds_queen", "diamonds_king", "spades_ace", "spades_2", "spades_3", "spades_4", "spades_5", "spades_6", "spades_7", "spades_8", "spades_9", "spades_10", "spades_jack", "spades_queen", "spades_king", "hearts_ace", "hearts_2", "hearts_3", "hearts_4", "hearts_5", "hearts_6", "hearts_7", "hearts_8", "hearts_9", "hearts_10", "hearts_jack", "hearts_queen", "hearts_king"]
    var noNoArray : [Int] = []
    var acceptable = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dealButton(_ sender: Any) {
        acceptable = false
        userCount = 0
        dealerCount = 0
        var rand = Int.random(in: 0...51)
        
        dCard1.image = UIImage(named: cardArray[rand])
        addDealerAmmount(rand)
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
                addAmmount(rand)
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
                noNoArray.append(rand)
                addAmmount(rand)
            }
        }
        var status = checkGameStatus(userCount, dealerCount)
        if status == 2 {
            gameOver = true
            print("You lose. Dealer Blackjack")
        } else if status == 3 {
            gameOver = true
            print("You win. Dealer bust")
        } else if status == 4 {
            gameOver = true
            print("You win. User Blackjack")
        } else if status == 5 {
            gameOver = true
            print("You lose. User bust")
        }  else if status == 1 {
            print("active")
        }
        userAmmount.text = String(userCount)
        dealerAmmount.text = String(dealerCount)
        
        
        
    }
    
    @IBAction func hitButton(_ sender: Any) {
        var check = true
        var rand = Int.random(in: 0...51)
        for items in noNoArray {
            if items == rand {
                check = false
            }
        }
        if check == true {
            acceptable = true
            
            uCard3.image = UIImage(named: cardArray[rand])
            noNoArray.append(rand)
            addAmmount(rand)
        }
    }
    
    @IBAction func standButton(_ sender: Any) {
    }
    
    @IBAction func betButton(_ sender: Any) {
    }
    
    func addAmmount(_ rand: Int) {
        if rand == 0 || rand == 13 || rand == 26 || rand == 39 {
            userCount = userCount + 1
        } else if rand == 1 || rand == 14 || rand == 27 || rand == 40 {
            userCount = userCount + 2
        } else if rand == 2 || rand == 15 || rand == 28 || rand == 41 {
            userCount = userCount + 3
        } else if rand == 3 || rand == 16 || rand == 29 || rand == 42 {
            userCount = userCount + 4
        } else if rand == 4 || rand == 17 || rand == 30 || rand == 43 {
            userCount = userCount + 5
        } else if rand == 5 || rand == 18 || rand == 31 || rand == 44 {
            userCount = userCount + 6
        } else if rand == 6 || rand == 19 || rand == 32 || rand == 45 {
            userCount = userCount + 7
        } else if rand == 7 || rand == 20 || rand == 33 || rand == 46 {
            userCount = userCount + 8
        } else if rand == 8 || rand == 21 || rand == 34 || rand == 47 {
            userCount = userCount + 9
        } else if rand == 9 || rand == 22 || rand == 35 || rand == 48 {
            userCount = userCount + 10
        } else if rand == 10 || rand == 23 || rand == 36 || rand == 49 {
            userCount = userCount + 11
        } else if rand == 11 || rand == 24 || rand == 37 || rand == 50 {
            userCount = userCount + 12
        } else if rand == 12 || rand == 25 || rand == 38 || rand == 51 {
            userCount = userCount + 13
        }
    }
    
    func addDealerAmmount(_ rand: Int) {
        if rand == 0 || rand == 13 || rand == 26 || rand == 39 {
            dealerCount = dealerCount + 1
        } else if rand == 1 || rand == 14 || rand == 27 || rand == 40 {
            dealerCount = dealerCount + 2
        } else if rand == 2 || rand == 15 || rand == 28 || rand == 41 {
            dealerCount = dealerCount + 3
        } else if rand == 3 || rand == 16 || rand == 29 || rand == 42 {
            dealerCount = dealerCount + 4
        } else if rand == 4 || rand == 17 || rand == 30 || rand == 43 {
            dealerCount = dealerCount + 5
        } else if rand == 5 || rand == 18 || rand == 31 || rand == 44 {
            dealerCount = dealerCount + 6
        } else if rand == 6 || rand == 19 || rand == 32 || rand == 45 {
            dealerCount = dealerCount + 7
        } else if rand == 7 || rand == 20 || rand == 33 || rand == 46 {
            dealerCount = dealerCount + 8
        } else if rand == 8 || rand == 21 || rand == 34 || rand == 47 {
            dealerCount = dealerCount + 9
        } else if rand == 9 || rand == 22 || rand == 35 || rand == 48 {
            dealerCount = dealerCount + 10
        } else if rand == 10 || rand == 23 || rand == 36 || rand == 49 {
            dealerCount = dealerCount + 11
        } else if rand == 11 || rand == 24 || rand == 37 || rand == 50 {
            dealerCount = dealerCount + 12
        } else if rand == 12 || rand == 25 || rand == 38 || rand == 51 {
            dealerCount = dealerCount + 13
        }
    }
    
    
    
    
    func checkGameStatus(_ u: Int, _ d: Int) -> Int {
        //returns 1 for active game, 2 for dealer blackjack, 3 for delaer bust, 4 for user blackjack, 5 for user bust
        if d == 21 {
            return 2
        } else if d > 21 {
            return 3
        } else if u == 21 {
            return 4
        } else if u > 21 {
            return 5
        } else {
            return 1
        }
    }
    
}
