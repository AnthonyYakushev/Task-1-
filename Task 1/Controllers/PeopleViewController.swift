//
//  TableViewController.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/2/21.
//

import UIKit

class PeopleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    var peoples = [PeopleData]()
    
    // MARK: - Life Cylce
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        tableView.register(TableCell.self, forCellReuseIdentifier: "cell")
        fillInPeoplesArray()
    }
    
    // MARK: - Methods
    func fillInPeoplesArray() {
        AlamofireRequest.sendRequest(url: Constants.url) { [weak self] (peoples) in
            self?.peoples = peoples
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden = true
            self?.tableView.reloadData()
            self?.tableView.isHidden = false
        }
    }
    
    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peoples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let people = peoples[indexPath.row]
        cell.textLabel?.text = people.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = peoples[indexPath.row]
        
        let vc = MyCollectionViewController(nibName: "MyCollectionViewController", bundle: nil)
        guard let url = object.url else { return }
        vc.myentity = .people
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
