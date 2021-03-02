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
        
        AF.request(url).response { (response) in
            guard let data = response.data else { return }
            do {
                let jsonDecoder = JSONDecoder()
                let request = try jsonDecoder.decode(Request.self, from: data)
                let urlPeople = request.people
                
                AF.request(urlPeople).response { (response) in
                    guard let data = response.data else { return }
                    do {
                        let jsonDecoder = JSONDecoder()
                        let peopleRequest = try jsonDecoder.decode(PeopleRequest.self, from: data)
                        completion(peopleRequest.results)
                    }
                    catch {
                        print(error)
                    }
                }
            } catch {
                print(error)
            }
        }
    }
}

