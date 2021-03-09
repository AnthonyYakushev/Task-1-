//
//  StarshipDescription.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/5/21.
//

import Foundation

struct StarshipDescription {
    var title: String
    var subtitle: [String]
    
    static func getArrayFromFilms(_ starship: StarshipsData) -> [StarshipDescription] {
        var starshipDescriptionArray = [StarshipDescription]()
        
        if let name = starship.name, name.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "Name:", subtitle: [name]))
        }
        
        if let model = starship.model {
            starshipDescriptionArray.append(StarshipDescription(title: "Model:", subtitle: [model]))
        }
        
        if let manufacturer = starship.manufacturer, manufacturer.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "Manufacturer:", subtitle: [manufacturer]))
        }
        
        if let costInCredits = starship.costInCredits, costInCredits.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "Cost in credits:", subtitle: [costInCredits]))
        }
        
        if let length = starship.length, length.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "Length:", subtitle: [length]))
        }
        
        if let maxAtmosphereSpped = starship.maxAtmospheringSpeed, maxAtmosphereSpped.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "Max Atmosphere Speed:", subtitle: [maxAtmosphereSpped]))
        }
        
        if let crew = starship.crew, crew.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "Crew:", subtitle: [crew]))
        }
        
        if let passengers = starship.passengers, passengers.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "Passengers:", subtitle: [passengers]))
        }
        
        if let cargoCapacity = starship.cargoCapacity, cargoCapacity.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "Cargo capacity:", subtitle: [cargoCapacity]))
        }
        
        if let consumables = starship.consumables, consumables.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "Consumables:", subtitle: [consumables]))
        }
        
        if let hyperdriveRating = starship.hyperdriveRating, hyperdriveRating.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "People:", subtitle: [hyperdriveRating]))
        }
        
        if let MGLT = starship.MGLT, MGLT.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "MGLT:", subtitle: [MGLT]))
        }
        
        if let starshipClass = starship.starshipClass, starshipClass.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "Starship class:", subtitle: [starshipClass]))
        }
        
        if let pilots = starship.pilots, pilots.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "Pilots:", subtitle: pilots))
        }
        
        if let films = starship.films, films.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "Films:", subtitle: films))
        }
        
        if let created = starship.created, created.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "Created:", subtitle: [created.getDate()]))
        }
        
        if let edited = starship.edited, edited.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "Edited:", subtitle: [edited.getDate()]))
        }
        
        if let url = starship.url, url.isEmpty == false {
            starshipDescriptionArray.append(StarshipDescription(title: "URL:", subtitle: [url]))
        }
        
        return starshipDescriptionArray
    }
}
