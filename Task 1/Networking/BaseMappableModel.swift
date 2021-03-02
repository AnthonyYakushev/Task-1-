//
//  BaseMappableModel.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/2/21.
//

import Foundation
import ObjectMapper

public class BaseMappableModel: NSObject, Mappable {
    
    public required init?(map: Map) {
        super.init()
    }
    
    public required override init() {
        super.init()
    }
    
    public func createUnmanaged() {
    }

    public func mapping(map: Map) {
        
    }
}
