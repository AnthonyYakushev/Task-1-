//
//  AlomofireRequest.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/1/21.
//

import Foundation
import Alamofire

class AlamofireRequest {
    
    static func sendRequest(url: String, completion: @escaping (([People]) -> ())) {
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url).responseString { (response) in
            switch response.result {
            case .success(let string):
                guard let rqstt = Request(JSONString: string),
                      let urlString = rqstt.people,
                      let urlPeople = URL(string: urlString) else { return }
                
                AF.request(urlPeople).responseString { (response) in
                    switch response.result {
                    case .success(let string):
                        guard let peopleRequest = PeopleRequest(JSONString: string),
                              let peoples = peopleRequest.results else { return }
                        completion(peoples)
                    case .failure(let error):
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

