//
//  AlomofireRequest.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/1/21.
//

import Foundation
import Alamofire

class AlamofireRequest {
    static var isPaginating = false
    
    static func sendRequest(pagination: Bool = false, url: String, page: Int, completion: @escaping (Result<[People], Error>) -> Void) {
        
        if pagination {
            isPaginating = true
        }
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url).responseString { (response) in
            switch response.result {
            case .success(let string):
                guard let rqstt = Request(JSONString: string),
                      let urlString = rqstt.people,
                      let urlPeople = URL(string: urlString) else { return }
                
                AF.request("\(urlPeople)?page=\(page)").responseString { (response) in
                    switch response.result {
                    case .success(let string):
                        guard let peopleRequest = PeopleRequest(JSONString: string),
                              let peoples = peopleRequest.results else { return }
                        completion(.success(peoples))
                        if pagination {
                            isPaginating = false
                        }
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

