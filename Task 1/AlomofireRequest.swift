//
//  AlomofireRequest.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/1/21.
//

import Foundation
import Alamofire

class AlamofireRequest {
    
    static func sendRequest(url: String, completion: @escaping ((People) -> ())) {
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .get).validate().responseJSON { (response) in
            switch response.result {
            case .success(let data):
                if let value = data as? [String: Any] {
                    if let people = People(dict: value) {
                        completion(people)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
