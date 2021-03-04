//
//  Starships.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/4/21.
//

import Foundation
import ObjectMapper

class Starships: BaseMappableModel {
    var name: String?
    var model: String?
    var manufacturer: String?
    var costInCredits: String?
    var length: String?
    var maxAtmospheringSpeed: String?
    var crew: String?
    var passengers: String?
    var cargoCapacity: String?
    var consumables: String?
    var hyperdriveRating: String?
    var MGLT: String?
    var starshipClass: String?
    var pilots: [String]?
    var films: [String]?
    var created: String?
    var edited: String?
    var url: String?
    
    override func mapping(map: Map) {
        name <- map["name"]
        model <- map["model"]
        manufacturer <- map["manufacturer"]
        costInCredits <- map["cost_in_credits"]
        length <- map["length"]
        maxAtmospheringSpeed <- map["max_atmosphering_speed"]
        crew <- map["crew"]
        passengers <- map["passengers"]
        cargoCapacity <- map["cargo_capacity"]
        consumables <- map["consumables"]
        hyperdriveRating <- map["hyperdrive_rating"]
        MGLT <- map["MGLT"]
        starshipClass <- map["starship_class"]
        pilots <- map["pilots"]
        films <- map["films"]
        created <- map["created"]
        edited <- map["edited"]
        url <- map["url"]
    }
}
