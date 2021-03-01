//
//  DataViewController.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/1/21.
//

import UIKit

class DataViewController: UIViewController {
    
    
    @IBOutlet var collections: [UILabel]!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var harColorLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var homeWorldLabel: UILabel!
    @IBOutlet weak var filmsLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var vehiclesLabel: UILabel!
    @IBOutlet weak var starhipsLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var editedLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func dismissButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    private let url = "https://swapi.dev/api/people/1/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in collections {
            i.isHidden = true
        }

        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        AlamofireRequest.sendRequest(url: url) { (people) in
            DispatchQueue.main.async {
                self.nameLabel.text = people.name
                self.heightLabel.text = people.height
                self.massLabel.text = people.mass
                self.harColorLabel.text = people.hairColor
                self.skinColorLabel.text = people.skinColor
                self.eyeColorLabel.text = people.eyeColor
                self.birthLabel.text = people.birthYear
                self.genderLabel.text = people.gender
                self.homeWorldLabel.text = people.homeworld
                self.filmsLabel.text = people.films.joined(separator: " ")
                self.speciesLabel.text = people.species.joined(separator: " ")
                self.vehiclesLabel.text = people.vehicles.joined(separator: " ")
                self.starhipsLabel.text = people.starships.joined(separator: " ")
                self.createdLabel.text = people.created
                self.editedLabel.text = people.edited
                self.urlLabel.text = people.url
                
                self.activityIndicator.stopAnimating()
                
                for i in self.collections {
                    i.isHidden = false
                }
            }
        }
    }
    
}
