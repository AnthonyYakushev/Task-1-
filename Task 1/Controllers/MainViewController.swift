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
        if let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ListViewController") as? ListViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

