//
//  SpeciesDescription.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/5/21.
//

import Foundation

struct SpeciesDescription: EntityDescription {
    var title: String
    var subtitle: [String]
    
    static func getArrayFromFilms(_ species: SpeciesData) -> [SpeciesDescription] {
        var speciesDescriptionArray = [SpeciesDescription]()
        
        if let name = species.name, name.isEmpty == false {
            speciesDescriptionArray.append(SpeciesDescription(title: "Name:", subtitle: [name]))
        }
        
        if let classification = species.classification {
            speciesDescriptionArray.append(SpeciesDescription(title: "Classification:", subtitle: ["\(classification)"]))
        }
        
        if let designation = species.designation, designation.isEmpty == false {
            speciesDescriptionArray.append(SpeciesDescription(title: "Designation:", subtitle: [designation]))
        }
        
        if let averageHeight = species.averageHeight, averageHeight.isEmpty == false {
            speciesDescriptionArray.append(SpeciesDescription(title: "Average Height:", subtitle: [averageHeight]))
        }
        
        if let skinColor = species.skinColors, skinColor.isEmpty == false {
            speciesDescriptionArray.append(SpeciesDescription(title: "Skin colors:", subtitle: [skinColor]))
        }
        
        if let hairColor = species.hairColors, hairColor.isEmpty == false {
            speciesDescriptionArray.append(SpeciesDescription(title: "Hair color:", subtitle: [hairColor]))
        }
        
        if let eyeColor = species.eyeColors, eyeColor.isEmpty == false {
            speciesDescriptionArray.append(SpeciesDescription(title: "Eye colors:", subtitle: [eyeColor]))
        }
        
        if let averageLifespan = species.averageLifespan, averageLifespan.isEmpty == false {
            speciesDescriptionArray.append(SpeciesDescription(title: "Average Lifespan:", subtitle: [averageLifespan]))
        }
        
        if let homeworld = species.homeworld, homeworld.isEmpty == false {
            speciesDescriptionArray.append(SpeciesDescription(title: "Homeworld:", subtitle: [homeworld]))
        }
        
        if let language = species.language, language.isEmpty == false {
            speciesDescriptionArray.append(SpeciesDescription(title: "Language:", subtitle: [language]))
        }
        
        if let people = species.people, people.isEmpty == false {
            speciesDescriptionArray.append(SpeciesDescription(title: "People:", subtitle: people))
        }
        
        if let films = species.films, films.isEmpty == false {
            speciesDescriptionArray.append(SpeciesDescription(title: "Films:", subtitle: films))
        }
        
        if let created = species.created, created.isEmpty == false {
            speciesDescriptionArray.append(SpeciesDescription(title: "Created:", subtitle: [created.getDate()]))
        }
        
        if let edited = species.edited, edited.isEmpty == false {
            speciesDescriptionArray.append(SpeciesDescription(title: "Edited:", subtitle: [edited.getDate()]))
        }
        
        if let url = species.url, url.isEmpty == false {
            speciesDescriptionArray.append(SpeciesDescription(title: "URL:", subtitle: [url]))
        }
        
        return speciesDescriptionArray
    }
}
