//
//  DataViewController.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/1/21.
//

import UIKit

class DataViewController: UIViewController {
    
    // MARK: - Outlets
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
    
    // MARK: - Variables
    var people: People?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePage(people: people)
    }
    
    // MARK: - Methods
    func configurePage(people: People?) {
        self.nameLabel.text = "Name: \(people?.name ?? "-")"
        self.heightLabel.text = "Height: \(people?.height ?? "-")"
        self.massLabel.text = "Mass: \(people?.mass ?? "-")"
        self.harColorLabel.text = "Hair Color: \(people?.hairColor ?? "-")"
        self.skinColorLabel.text = "Skin Color: \(people?.skinColor ?? "-")"
        self.eyeColorLabel.text = "Eye Color: \(people?.eyeColor ?? "-")"
        self.birthLabel.text = "Birth Year: \(people?.birthYear ?? "-")"
        self.genderLabel.text = "Gender: \(people?.gender ?? "-")"
        self.homeWorldLabel.text = people?.homeworld
        self.filmsLabel.text = people?.films.joined(separator: " ")
        self.speciesLabel.text = people?.species.joined(separator: " ")
        self.vehiclesLabel.text = people?.vehicles.joined(separator: " ")
        self.starhipsLabel.text = people?.starships.joined(separator: " ")
        self.createdLabel.text = people?.created
        self.editedLabel.text = people?.edited
        self.urlLabel.text = people?.url
    }
}
