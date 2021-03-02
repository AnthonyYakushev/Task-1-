//
//  TableViewController.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/2/21.
//

import UIKit

class ListViewController: UITableViewController {
    
    // MARK: - Variables
    var peoples = [People]()
    
    // MARK: - Life Cylce
    override func viewDidLoad() {
        fillInPeoplesArray(url: Constants.url)
        tableView.register(MyCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - Methods
    func fillInPeoplesArray(url: String) {
        AlamofireRequest.sendRequest(url: url) { [weak self] (peoples) in
            self?.peoples = peoples
            self?.tableView.reloadData()
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
        
        let vc = DataViewController(nibName: "DataViewController", bundle: nil)
        vc.people = object
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
