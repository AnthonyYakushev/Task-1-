//
//  TableViewController.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/2/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Variables
    var peoples = [People]()
    var pickedPeople: People?
    
    // MARK: - Life Cylce
    override func viewDidLoad() {
        fillInPeoplesArray(url: Constants.url)
    }
    
    // MARK: - Methods
    func fillInPeoplesArray(url: String) {
        AlamofireRequest.sendRequest(url: url) { (ppls) in
            self.peoples = ppls
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DataViewController {
            vc.people = pickedPeople
        }
    }
    
    // MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return peoples.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let people = peoples[indexPath.row]
        cell.textLabel?.text = people.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = peoples[indexPath.row]
        pickedPeople = object
        performSegue(withIdentifier: "Second Segue", sender: nil)
    }
}
