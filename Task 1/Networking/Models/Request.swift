//
//  Request.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/2/21.
//

import Foundation
import ObjectMapper

class Request: BaseMappableModel {
    var people: String?
    
    override func mapping(map: Map) {
        people <- map["people"]
    }
}

