//
//  Species.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/4/21.
//

import Foundation
import ObjectMapper

class species: BaseMappableModel {
    var name: String?
    var classification: String?
    var designation: String?
    var averageHeight: String?
    var skinColors: String?
    var hairColors: String?
    var eyeColors: String?
    var averageLifespan: String?
    var homeworld: String?
    var language: String?
    var people: [String]?
    var films: [String]?
    var created: String?
    var edited: String?
    var url: String?
    
    override func mapping(map: Map) {
        name <- map["name"]
        classification <- map["classification"]
        designation <- map["designation"]
        averageHeight <- map["average_height"]
        skinColors <- map["skin_colors"]
        hairColors <- map["hair_colors"]
        eyeColors <- map["eye_colors"]
        averageLifespan <- map["average_lifespan"]
        homeworld <- map["homeworld"]
        language <- map["language"]
        people <- map["people"]
        films <- map["films"]
        created <- map["created"]
        edited <- map["edited"]
        url <- map["url"]
    }
}
