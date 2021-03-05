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
    
    var people: PeopleData? {
        didSet {
            if let people = people {
                self.peopleDescriptions = PeopleDescription.getArrayFromPeople(people)
                self.updateUI()
            }
        }
    }
    var peopleDescriptions = [PeopleDescription]()
    
    var film: FilmData? {
        didSet {
            if let film = film {
                self.films = FilmDescription.getArrayFromFilms(film)
                self.updateUI()
            }
        }
    }
    var films = [FilmDescription]()
    
    var planet: PlanetData? {
        didSet {
            if let planet = planet {
                self.planets = PlanetDescription.getArrayFromFilms(planet)
                self.updateUI()
            }
        }
    }
    var planets = [PlanetDescription]()
    
    var species: SpeciesData? {
        didSet {
            if let species = species {
                self.speciesArray = SpeciesDescription.getArrayFromFilms(species)
                self.updateUI()
            }
        }
    }
    
    var speciesArray = [SpeciesDescription]()
    
    var starship: StarshipsData? {
        didSet {
            if let starship = starship {
                self.starships = StarshipDescription.getArrayFromFilms(starship)
                self.updateUI()
            }
        }
    }
    
    var starships = [StarshipDescription]()
    
    var vehicle: VehicleData? {
        didSet {
            if let vehicle = vehicle {
                self.vehicles = VehicleDescription.getArrayFromFilms(vehicle)
                self.updateUI()
            }
        }
    }
    
    var vehicles = [VehicleDescription]()
    
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
        switch myentity {
        case .film:
            return films.count
        case .planet:
            return planets.count
        case .species:
            return speciesArray.count
        case .starship:
            return starships.count
        case .vehicle:
            return vehicles.count
        case .people:
            return peopleDescriptions.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        switch myentity {
        case .film:
            let object = films[indexPath.row]
            cell.title.text = object.title
            cell.subtitles = object.subtitle
            cell.delegate = self
            return cell
        case .planet:
            let object = planets[indexPath.row]
            cell.title.text = object.title
            cell.subtitles = object.subtitle
            cell.delegate = self
            return cell
        case .species:
            let object = speciesArray[indexPath.row]
            cell.title.text = object.title
            cell.subtitles = object.subtitle
            cell.delegate = self
            return cell
        case .starship:
            let object = starships[indexPath.row]
            cell.title.text = object.title
            cell.subtitles = object.subtitle
            cell.delegate = self
            return cell
        case .vehicle:
            let object = vehicles[indexPath.row]
            cell.title.text = object.title
            cell.subtitles = object.subtitle
            cell.delegate = self
            return cell
        case .people:
            let object = peopleDescriptions[indexPath.row]
            cell.title.text = object.title
            cell.subtitles = object.subtitle
            cell.delegate = self
            return cell
        case .none:
            return cell
        }
    }
}
