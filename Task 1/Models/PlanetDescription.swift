//
//  PlanetDescription.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/5/21.
//

import Foundation

struct PlanetDescription: EntityDescription {
    var title: String
    var subtitle: [String]
    
    static func getArrayFromFilms(_ planet: PlanetData) -> [PlanetDescription] {
        var planetDescriptionArray = [PlanetDescription]()
        
        if let name = planet.name, name.isEmpty == false {
            planetDescriptionArray.append(PlanetDescription(title: "Name:", subtitle: [name]))
        }
        
        if let rotationPeriod = planet.rotationPeriod {
            planetDescriptionArray.append(PlanetDescription(title: "Rotation:", subtitle: ["\(rotationPeriod)"]))
        }
        
        if let orbitalPeriod = planet.orbitalPeriod, orbitalPeriod.isEmpty == false {
            planetDescriptionArray.append(PlanetDescription(title: "Orbital period:", subtitle: [orbitalPeriod]))
        }
        
        if let diameter = planet.diameter, diameter.isEmpty == false {
            planetDescriptionArray.append(PlanetDescription(title: "Diameter:", subtitle: [diameter]))
        }
        
        if let climate = planet.climate, climate.isEmpty == false {
            planetDescriptionArray.append(PlanetDescription(title: "Climate:", subtitle: [climate]))
        }
        
        if let gravity = planet.gravity, gravity.isEmpty == false {
            planetDescriptionArray.append(PlanetDescription(title: "Gravity", subtitle: [gravity]))
        }
        
        if let terrain = planet.terrain, terrain.isEmpty == false {
            planetDescriptionArray.append(PlanetDescription(title: "Terrain:", subtitle: [terrain]))
        }
        
        if let surfaceWater = planet.surfaceWater, surfaceWater.isEmpty == false {
            planetDescriptionArray.append(PlanetDescription(title: "Surface Water:", subtitle: [surfaceWater]))
        }
        
        if let population = planet.surfaceWater, population.isEmpty == false {
            planetDescriptionArray.append(PlanetDescription(title: "Population:", subtitle: [population]))
        }
        
        if let residents = planet.residents, residents.isEmpty == false {
            planetDescriptionArray.append(PlanetDescription(title: "Residents:", subtitle: residents))
        }
        
        if let films = planet.films, films.isEmpty == false {
            planetDescriptionArray.append(PlanetDescription(title: "Films:", subtitle: films))
        }
        
        if let created = planet.created, created.isEmpty == false {
            planetDescriptionArray.append(PlanetDescription(title: "Created:", subtitle: [created.getDate()]))
        }
        
        if let edited = planet.edited, edited.isEmpty == false {
            planetDescriptionArray.append(PlanetDescription(title: "Edited:", subtitle: [edited.getDate()]))
        }
        
        if let url = planet.url, url.isEmpty == false {
            planetDescriptionArray.append(PlanetDescription(title: "URL:", subtitle: [url]))
        }
        
        return planetDescriptionArray
    }
}
