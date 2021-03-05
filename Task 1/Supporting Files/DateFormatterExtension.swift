//
//  DateFormatterExtension.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/5/21.
//

import Foundation
import SwiftDate

func getDate(string: String) -> String {
    
    if let newdate = string.toDate() {
        return newdate.date.toFormat("dd.MM.yyyy")
    }
    return string
}
