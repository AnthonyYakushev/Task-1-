//
//  MyCollectionViewController.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/3/21.
//

import UIKit
import ObjectMapper

class MyCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, PresentingVCDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    lazy var url = ""
    var myentity: Entity?
    var entityDescriptions: [EntityDescription]?
    var data: BaseMappableModel?
    
    var people: PeopleData? {
        didSet {
            if let people = people {
                self.entityDescriptions = PeopleDescription.getArrayFromPeople(people)
                self.updateUI()
            }
        }
    }
    
    var film: FilmData? {
        didSet {
            if let film = film {
                self.entityDescriptions = FilmDescription.getArrayFromFilms(film)
                self.updateUI()
            }
        }
    }
    
    var planet: PlanetData? {
        didSet {
            if let planet = planet {
                self.entityDescriptions = PlanetDescription.getArrayFromFilms(planet)
                self.updateUI()
            }
        }
    }
    
    var species: SpeciesData? {
        didSet {
            if let species = species {
                self.entityDescriptions = SpeciesDescription.getArrayFromFilms(species)
                self.updateUI()
            }
        }
    }
    lazy var speciesArray = [SpeciesDescription]()
    
    var starship: StarshipsData? {
        didSet {
            if let starship = starship {
                self.entityDescriptions = StarshipDescription.getArrayFromFilms(starship)
                self.updateUI()
            }
        }
    }
    
    var vehicle: VehicleData? {
        didSet {
            if let vehicle = vehicle {
                self.entityDescriptions = VehicleDescription.getArrayFromFilms(vehicle)
                self.updateUI()
            }
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "CollectionCell", bundle: nil),forCellWithReuseIdentifier: "CollectionCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.startAnimating()
        
        guard let entity = myentity else { return }
        reusableRequest(url: url, description: entity)
    }
    
    // MARK: - Methods
    func reusableRequest(url: String, description: Entity) {
        AlamofireRequest.reusableRequest(url: url, description: description) { [weak self] (data) in
            switch description {
            case .planet:
                self?.planet = data as? PlanetData
            case .film:
                self?.film = data as? FilmData
            case .species:
                self?.species = data as? SpeciesData
            case  .vehicle:
                self?.vehicle = data as? VehicleData
            case .starship:
                self?.starship = data as? StarshipsData
            case .people:
                self?.people = data as? PeopleData
            }
        }
    }
    
    func pushVC(string: String, description: Entity) {
        let vc = MyCollectionViewController(nibName: "MyCollectionViewController", bundle: nil)
        vc.url = string
        vc.myentity = description
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func updateUI() {
        self.activityIndicator.stopAnimating()
        self.collectionView.reloadData()
    }
    // MARK:- UICollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let entityDescription = entityDescriptions else { return 0 }
        return entityDescription.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        guard let entityDescription = entityDescriptions else { return cell}
        let object = entityDescription[indexPath.row]
        cell.title.text = object.title
        cell.subtitles = object.subtitle
        cell.delegate = self
        return cell
    }
}
