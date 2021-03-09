//
//  DateFormatterExtension.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/5/21.
//

import Foundation
import SwiftDate

extension String {
    func getDate() -> String {
        if let newdate = self.toDate() {
            return newdate.date.toFormat("dd.MM.yyyy")
        }
        return self
    }
}
