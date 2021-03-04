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
    var indexOfpage = 1
    lazy var size = tableView.bounds.height / CGFloat(peoples.count + 1)
    
    // MARK: - Life Cylce
    override func viewDidLoad() {
        fillInPeoplesArray()
        tableView.register(TableCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - Methods
    func fillInPeoplesArray() {
        AlamofireRequest.sendRequest(pagination: true, url: Constants.url, page: indexOfpage) { [weak self] (result) in
            switch result {
            case .success(let data):
                self?.peoples = data
                self?.tableView.reloadData()
            case .failure(_):
                break
            }
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
        
        let vc = DataViewController(nibName: "MyCollectionViewController", bundle: nil)
        vc.people = object
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return size
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = tableView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > (contentHeight - scrollView.frame.size.height)  {
            guard !AlamofireRequest.isPaginating else { return }
            indexOfpage += 1
            AlamofireRequest.sendRequest(pagination: true, url: Constants.url, page: indexOfpage) { [weak self] (result) in
                switch result {
                case .success(let data):
                    self?.peoples += data
                    self?.tableView.reloadData()
                case .failure(_):
                    break
                }
            }
        }
    }
}
