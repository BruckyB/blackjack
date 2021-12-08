//
//  MainGame.swift
//  blackjack
//
//  Created by JOHN BRUCKER on 11/30/21.
//

import UIKit

class MainGame: UIViewController {
    
    
    @IBOutlet weak var dealerLabel: UILabel!
    
    @IBOutlet weak var currentBetLabel: UILabel!
    @IBOutlet weak var currentBalanceLabel: UILabel!
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userAmmount: UILabel!
    @IBOutlet weak var dealerAmmount: UILabel!
    @IBOutlet weak var statusLabel: UILabel! // Don't change for dark mode
    
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
    var currentDealerCard = 2
    var activeGame = false
    var bet = 0
    var currentAmount = DataTransfer.startingAmount
    
    
    
    var cardArray : [String] = ["clubs_ace", "clubs_2", "clubs_3", "clubs_4", "clubs_5", "clubs_6", "clubs_7", "clubs_8", "clubs_9", "clubs_10", "clubs_jack", "clubs_queen", "clubs_king","diamonds_ace", "diamonds_2", "diamonds_3", "diamonds_4", "diamonds_5", "diamonds_6", "diamonds_7", "diamonds_8", "diamonds_9", "diamonds_10", "diamonds_jack", "diamonds_queen", "diamonds_king", "spades_ace", "spades_2", "spades_3", "spades_4", "spades_5", "spades_6", "spades_7", "spades_8", "spades_9", "spades_10", "spades_jack", "spades_queen", "spades_king", "hearts_ace", "hearts_2", "hearts_3", "hearts_4", "hearts_5", "hearts_6", "hearts_7", "hearts_8", "hearts_9", "hearts_10", "hearts_jack", "hearts_queen", "hearts_king"]
    var noNoArray : [Int] = []
    var acceptable = false
    override func viewDidLoad() {
        if DataTransfer.darkMode == true {
            self.view.backgroundColor = UIColor.black
            dealerLabel.textColor = UIColor.white
            currentBalanceLabel.textColor = UIColor.white
            currentBetLabel.textColor  = UIColor.white
            userLabel.textColor = UIColor.white
            userAmmount.textColor = UIColor.white
            dealerAmmount.textColor = UIColor.white
        }
        super.viewDidLoad()
        statusLabel.textColor = UIColor.red
        currentBetLabel.text = "Current Bet: \(bet)"
        currentBalanceLabel.text = "Current Balance: \(currentAmount)"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func dealButton(_ sender: Any) {
        noNoArray = []
        acceptable = false
        activeGame = true
        userCount = 0
        dealerCount = 0
        currentUCard = 3
        currentDealerCard = 2
        uCard1.image = nil
        uCard2.image = nil
        uCard3.image = nil
        uCard4.image = nil
        uCard5.image = nil
        uCard6.image = nil
        dCard1.image = nil
        dCard2.image = nil
        dCard3.image = nil
        dCard4.image = nil
        dCard5.image = nil
        dCard6.image = nil
        statusLabel.text = ""
        var rand = Int.random(in: 0...51)
        if currentAmount < bet {
            statusLabel.text = "Bet is too high, please lower"
        } else {
        
        
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
        acceptable = false
        var status = checkGameStatus(userCount, dealerCount)
        if status == 2 {
            activeGame = false
            print("You lose. Dealer Blackjack")
            lose()
        } else if status == 3 {
            activeGame = false
            print("You win. Dealer bust")
            win()
            activeGame = false
            statusLabel.text = "You win! User Blackjack"
        } else if status == 5 {
            win()
            statusLabel.text = "You lose! User bust"
            lose()
        }
        userAmmount.text = String(userCount)
        dealerAmmount.text = String(dealerCount)
        
        
        }
    }
    
        
    @IBAction func hitButton(_ sender: Any) {
    if currentUCard < 7 && activeGame == true{
        var check = true
        var rand = Int.random(in: 0...51)
        for items in noNoArray {
            if items == rand {
                check = false
            }
        }
        if check == true {
            acceptable = true
            if currentUCard == 3 {
                uCard3.image = UIImage(named: cardArray[rand])
                currentUCard = 4
                statusLabel.text = ""
            } else if currentUCard == 4 {
                uCard4.image = UIImage(named: cardArray[rand])
                currentUCard = 5
                statusLabel.text = ""
            } else if currentUCard == 5 {
                uCard5.image = UIImage(named: cardArray[rand])
                currentUCard = 6
                statusLabel.text = ""
            } else if currentUCard == 6 {
                uCard6.image = UIImage(named: cardArray[rand])
                currentUCard = 7
                statusLabel.text = ""
            } else {
                statusLabel.text = "Out of card slots. Please stand"
            }
            noNoArray.append(rand)
            addAmmount(rand)
            userAmmount.text = String(userCount)
            var status = checkGameStatus(userCount, dealerCount)
            if status == 2 {
                activeGame = false
                print("You lose. Dealer Blackjack")
                lose()

            } else if status == 3 {
                activeGame = false
                print("You win. Dealer bust")
                win()
            } else if status == 4 {
                activeGame = false
                statusLabel.text = "You win! User Blackjack"
                win()
            } else if status == 5 {
                activeGame = false
                statusLabel.text = "You lose! User bust"
                lose()

            }  else if status == 1 {
                print("active")
            }
        }
        }
    }
    
    @IBAction func standButton(_ sender: Any) {
        while activeGame == true {
        while acceptable == false {
            var check = true
            var rand = Int.random(in: 0...51)
            for items in noNoArray {
                if items == rand {
                    check = false
                }
            }
            if check == true {
                acceptable = true
                if currentDealerCard == 2 {
                    dCard2.image = UIImage(named: cardArray[rand])
                    currentDealerCard = 3
                    statusLabel.text = ""
                } else if currentDealerCard == 3 {
                    dCard3.image = UIImage(named: cardArray[rand])
                    currentDealerCard = 4
                    statusLabel.text = ""
                } else if currentDealerCard == 4 {
                    dCard4.image = UIImage(named: cardArray[rand])
                    currentDealerCard = 5
                    statusLabel.text = ""
                } else if currentDealerCard == 5 {
                    dCard5.image = UIImage(named: cardArray[rand])
                    currentDealerCard = 6
                    statusLabel.text = ""
                } else if currentDealerCard == 6 {
                    dCard6.image = UIImage(named: cardArray[rand])
                    currentDealerCard = 7
                    statusLabel.text = ""
                } else {
                    statusLabel.text = "You Win! Dealer ran out of card slots"
                    win()
                }
                noNoArray.append(rand)
                addDealerAmmount(rand)
                dealerAmmount.text = String(dealerCount)
                if dealerCount > 21 {
                    acceptable = true
                }
            }
        }
        acceptable = false
            
            var status = checkGameStatus(userCount, dealerCount)
            
            if dealerCount > 16 {
                if dealerCount > 21 {
                    statusLabel.text = "You Win! Dealer busted"
                    win()
                } else if dealerCount > userCount {
                    statusLabel.text = "You lose! Dealer has a higher number"
                    lose()
                } else {
                    statusLabel.text = "You win! Dealers number is too low"
                    win()
                }
                
                activeGame = false
                
            }
        }
    }
    
    @IBAction func betButton(_ sender: Any) {
        if Int(textField.text!)! <= currentAmount {
        bet = Int(textField.text!)!
        currentBetLabel.text = "Current Bet: \(bet)"
        } else {
        statusLabel.text = "Bet is too high, please lower"
        }
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
            userCount = userCount + 10
        } else if rand == 11 || rand == 24 || rand == 37 || rand == 50 {
            userCount = userCount + 10
        } else if rand == 12 || rand == 25 || rand == 38 || rand == 51 {
            userCount = userCount + 10
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
            dealerCount = dealerCount + 10
        } else if rand == 11 || rand == 24 || rand == 37 || rand == 50 {
            dealerCount = dealerCount + 10
        } else if rand == 12 || rand == 25 || rand == 38 || rand == 51 {
            dealerCount = dealerCount + 10
        }
    }
    
    func win(){
        currentAmount = currentAmount + bet
        currentBalanceLabel.text = "Current Balance: \(currentAmount)"
        StatsScreen.data.append("You win! Balance: \(currentAmount)")
    }
    func lose(){
        currentAmount = currentAmount - bet
        currentBalanceLabel.text = "Current Balance: \(currentAmount)"
        StatsScreen.data.append("You lost. Balance: \(currentAmount)")
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
