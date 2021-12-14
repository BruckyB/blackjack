//
//  StatsScreen.swift
//  blackjack
//
//  Created by JOHN BRUCKER on 11/30/21.
//

import UIKit

class StatsScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableViewOutlet: UITableView!
    static var data : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        if DataTransfer.darkMode == true {
            self.view.backgroundColor = UIColor.black
            tableViewOutlet.backgroundColor = UIColor.black
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("In table view: \(StatsScreen.data.count)")
       return StatsScreen.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = StatsScreen.data[indexPath.row]
        if DataTransfer.darkMode == true {
            cell.textLabel?.textColor = UIColor.white
        } else {
            cell.textLabel?.textColor = UIColor.black
        }
        saveAction()
        return cell 
    }
    func saveAction(){
        UserDefaults.standard.set(StatsScreen.data, forKey: "gameHistory")
        //tableViewOutlet.reloadData()
 }
}
