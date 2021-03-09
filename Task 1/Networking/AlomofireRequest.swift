//
//  AlomofireRequest.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/1/21.
//

import Foundation
import Alamofire

class AlamofireRequest {
    static func sendRequest(url: String, completion: @escaping (([PeopleData]) -> ())) {
        
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
                              let peoplesData = peopleRequest.results else { return }
                        completion(peoplesData)
                    case .failure(let error):
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func reusableRequest(url: String, description: Entity, completion: @escaping ((BaseMappableModel) -> ())) {
        guard let url = URL(string: url) else { return }
        
        AF.request(url).responseString { (response) in
            switch response.result {
            case .success(let string):
                switch description {
                case .planet:
                    guard let data = PlanetData(JSONString: string) else { return }
                    completion(data)
                case .film:
                    guard let data = FilmData(JSONString: string) else { return }
                    completion(data)
                case .species:
                    guard let data = SpeciesData(JSONString: string) else { return }
                    completion(data)
                case .vehicle:
                    guard let data = VehicleData(JSONString: string) else { return }
                    completion(data)
                case .starship:
                    guard let data = StarshipsData(JSONString: string) else { return }
                    completion(data)
                case .people:
                    guard let data = PeopleData(JSONString: string) else { return }
                    completion(data)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

