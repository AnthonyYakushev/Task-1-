//
//  Film.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/4/21.
//

import Foundation
import ObjectMapper

class Film: BaseMappableModel {
    var title: String?
    var episodeID: Int?
    var openingCrawl: String?
    var director: String?
    var producer: String?
    var releaseDate: String?
    var characters: [String]?
    var planets: [String]?
    var starships: [String]?
    var vehicles: [String]?
    var species: [String]?
    var created: String?
    var edited: String?
    var url: String?
    
    override func mapping(map: Map) {
        title <- map["title"]
        episodeID <- map["episode_id"]
        openingCrawl <- map["opening_crawl"]
        director <- map["director"]
        producer <- map["producer"]
        releaseDate <- map["release_date"]
        characters <- map["characters"]
        planets <- map["planets"]
        starships <- map["starhips"]
        vehicles <- map["vehicles"]
        species <- map["species"]
        created <- map["created"]
        edited <- map["edited"]
        url <- map["url"]
    }
}
