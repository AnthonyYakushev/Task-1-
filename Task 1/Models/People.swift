//
//  People.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/1/21.
//

import Foundation

struct People: Codable {
    
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    let created: String
    let edited: String
    let url: String
    
    init?(dict: [String: Any]) {
        
        let name = dict["name"] as? String
        let height = dict["height"] as? String
        let mass = dict["mass"] as? String
        let hair_color = dict["hair_color"] as? String
        let skin_color = dict["skin_color"] as? String
        let eye_color = dict["eye_color"] as? String
        let birth_year = dict["birth_year"] as? String
        let gender = dict["gender"] as? String
        let homeworld = dict["homeworld"] as? String
        let films = dict["films"] as? [String]
        let species = dict["species"] as? [String]
        let vehicles = dict["vehicles"] as? [String]
        let starships = dict["starships"] as? [String]
        let created = dict["created"] as? String
        let edited = dict["edited"] as? String
        let url = dict["url"] as? String
        
        self.name = name ?? "-" // лучше в контроллере проверить на наличие данных и скрывать если их нет
        self.height = height ?? "-"
        self.mass = mass ?? "-"
        self.hairColor = hair_color ?? "-"
        self.skinColor = skin_color ?? "-"
        self.eyeColor = eye_color ?? "-"
        self.birthYear = birth_year ?? "-"
        self.gender = gender ?? "-"
        self.homeworld = homeworld ?? "-"
        self.films = films ?? ["-"]
        self.species = species ?? ["-"]
        self.vehicles = vehicles ?? ["-"]
        self.starships = starships ?? ["-"] 
        self.created = created ?? "-"
        self.edited = edited ?? "-"
        self.url = url ?? "-"
    }
}
