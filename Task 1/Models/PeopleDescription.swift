//
//  PeopleDescription.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/3/21.
//

import Foundation

struct PeopleDescription {
    var title: String
    var subtitle: [String]
    
    static func getArrayFromPeople(_ people: PeopleData) -> [PeopleDescription] {
        var peopleDescriptionArray = [PeopleDescription]()
        
        if let name = people.name, name.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "Name:", subtitle: [name]))
        }
        
        if let height = people.height, height.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "Height", subtitle: [height]))
        }
        
        if let mass = people.mass, mass.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "Mass:", subtitle: [mass]))
        }
        
        if let hairColor = people.hairColor, hairColor.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "Hair color:", subtitle: [hairColor]))
        }
        
        if let skinColor = people.skinColor, skinColor.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "Skin color:", subtitle: [skinColor]))
        }
        
        if let eyeColor = people.eyeColor, eyeColor.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "Eye color:", subtitle: [eyeColor]))
        }
        
        if let birthYear = people.birthYear, birthYear.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "Birth Date:", subtitle: [birthYear]))
        }
        
        if let gender = people.gender, gender.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "Gender:", subtitle: [gender]))
        }
        
        if let homeworld = people.homeworld, homeworld.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "homeWorld", subtitle: [homeworld]))
        }

        if let filmsData = people.films, filmsData.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "Films:", subtitle: filmsData))
        }
        
        if let species = people.species, species.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "Species:", subtitle: species))
        }
        
        if let vehicles = people.vehicles, vehicles.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "Vehicles:", subtitle: vehicles))
        }
        
        if let starships = people.starships, starships.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "Starships:", subtitle: starships))
        }
        
        if let created = people.created, created.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "Created:", subtitle: [created]))
        }
        
        if let edited = people.edited, edited.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "Edited:", subtitle: [edited]))
        }
        
        if let url = people.url, url.isEmpty == false {
            peopleDescriptionArray.append(PeopleDescription(title: "URL:", subtitle: [url]))
        }
        
        return peopleDescriptionArray
    }
}
