//
//  Vehicle.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/4/21.
//

import Foundation
import ObjectMapper

class VehicleData: BaseMappableModel {
    var name: String?
    var model: String?
    var manufacture: String?
    var costInCredits: String?
    var length: String?
    var maxAtmospheringSpeed: String?
    var crew: String?
    var passengers: String?
    var cargoCapacity: String?
    var consumables: String?
    var vehicleClass: String?
    var pilots: [String]?
    var films: [String]?
    var created: String?
    var edited: String?
    var url: String?
    
    override func mapping(map: Map) {
        name <- map["name"]
        model <- map["model"]
        manufacture <- map["manufacture"]
        costInCredits <- map["cost_in_credits"]
        maxAtmospheringSpeed <- map["max_atmosphering_speed"]
        crew <- map["crew"]
        cargoCapacity <- map["cargo_capacity"]
        consumables <- map["consumables"]
        vehicleClass <- map["vehicle_class"]
        pilots <- map["pilots"]
        films <- map["films"]
        created <- map["created"]
        edited <- map["edited"]
        url <- map["url"]
    }
}
