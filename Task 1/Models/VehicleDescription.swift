//
//  VehicleDescription.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/5/21.
//

import Foundation
import SwiftDate

struct VehicleDescription {
    var title: String
    var subtitle: [String]
    
    static func getArrayFromFilms(_ vehicle: VehicleData) -> [VehicleDescription] {
        var vehicleDescriptionArray = [VehicleDescription]()
        
        if let name = vehicle.name, name.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "Name:", subtitle: [name]))
        }
        
        if let model = vehicle.model {
            vehicleDescriptionArray.append(VehicleDescription(title: "Model:", subtitle: [model]))
        }
        
        if let manufacturer = vehicle.manufacture, manufacturer.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "Manufacturer:", subtitle: [manufacturer]))
        }
        
        if let costInCredits = vehicle.costInCredits, costInCredits.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "Cost in credits:", subtitle: [costInCredits]))
        }
        
        if let length = vehicle.length, length.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "Length:", subtitle: [length]))
        }
        
        if let maxAtmosphereSpped = vehicle.maxAtmospheringSpeed, maxAtmosphereSpped.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "Max Atmosphere Speed:", subtitle: [maxAtmosphereSpped]))
        }
        
        if let crew = vehicle.crew, crew.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "Crew:", subtitle: [crew]))
        }
        
        if let passengers = vehicle.passengers, passengers.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "Passengers:", subtitle: [passengers]))
        }
        
        if let cargoCapacity = vehicle.cargoCapacity, cargoCapacity.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "Cargo capacity:", subtitle: [cargoCapacity]))
        }
        
        if let consumables = vehicle.consumables, consumables.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "Consumables:", subtitle: [consumables]))
        }
        
        if let vehicleClass = vehicle.vehicleClass, vehicleClass.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "Vehicle class:", subtitle: [vehicleClass]))
        }
        
        if let pilots = vehicle.pilots, pilots.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "Pilots:", subtitle: pilots))
        }
        
        if let films = vehicle.films, films.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "Films:", subtitle: films))
        }
        
        if let created = vehicle.created, created.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "Created:", subtitle: [getDate(string: created)]))
        }
        
        if let edited = vehicle.edited, edited.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "Edited:", subtitle: [getDate(string: edited)]))
        }
        
        if let url = vehicle.url, url.isEmpty == false {
            vehicleDescriptionArray.append(VehicleDescription(title: "URL:", subtitle: [url]))
        }
        
        return vehicleDescriptionArray
    }
}
