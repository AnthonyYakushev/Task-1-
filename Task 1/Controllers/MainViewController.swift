//
//  ViewController.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/1/21.
//  

import UIKit

class MainViewController: UIViewController {
    // MARK: - IBActions
    @IBAction func requestButton(_ sender: UIButton) {
        let vc = PeopleViewController(nibName: "PeopleViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

