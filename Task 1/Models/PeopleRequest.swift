//
//  PeopleRequest.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/2/21.
//

import Foundation
import ObjectMapper

class PeopleRequest: BaseMappableModel {
    var count: Int?
    var next: String?
    var results: [People]?
    
    override func mapping(map: Map) {
        count <- map["count"]
        next <- map["next"]
        results <- map["results"]
    }
}
