//
//  Request.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/2/21.
//

import Foundation
import ObjectMapper

struct Request: Mappable {
    var people: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        people <- map["people"]
    }
}

