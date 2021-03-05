//
//  MyCollectionViewController.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/3/21.
//

import UIKit

class MyCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, PresentingVCDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    lazy var url = ""
    lazy var myentity = ""
    var isReusablePage = false
    
    var people: PeopleData?
    var peopleDescriptions = [PeopleDescription]()
    var film: FilmData? {
        didSet {
            reusableRequest(url: url, description: "films")
            if let film = film {
                self.films = FilmDescription.getArrayFromFilms(film)
                self.collectionView.reloadData()
            }
        }
    }
    var films = [FilmDescription]()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib(nibName: "CollectionCell", bundle: nil),forCellWithReuseIdentifier: "CollectionCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        if isReusablePage {
            
            reusableRequest(url: url, description: myentity)
            } else {
            if let people = people {
                self.peopleDescriptions = PeopleDescription.getArrayFromPeople(people)
            }
        }
        collectionView.reloadData()
    }
    
    func reusableRequest(url: String, description: String) {
        AlamofireRequest.reusableRequest(url: url, description: description) { (data) in
            switch description {
            //case "planets":
//                self.object = data as! Planet
            case "films":
                self.film = data as? FilmData
            //case "species":
//                self.object = data as! SpeciesData
            //case "vehicles":
//                self.object = data as! Vehicle
            //case "starships":
//                self.object = data as! Starships
            default:
                break
            }
        }
    }
    
    func pushVC(string: String, description: String) {
        let vc = MyCollectionViewController(nibName: "MyCollectionViewController", bundle: nil)
        vc.isReusablePage = true
        vc.url = string
        vc.myentity = description
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK:- UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isReusablePage {
            return films.count
        } else {
            return peopleDescriptions.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        if isReusablePage {
            let object = films[indexPath.row]
            cell.title.text = object.title
            cell.subtitles = object.subtitle
            cell.delegate = self
            return cell
        } else {
        let object = peopleDescriptions[indexPath.row]
        cell.title.text = object.title
        cell.subtitles = object.subtitle
        cell.delegate = self
        return cell
        }
    }
}
