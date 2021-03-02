//
//  PeopleRequest.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/2/21.
//

import Foundation

struct PeopleRequest: Codable {
    let count: Int
    let next: String
    let results: [People]
}
