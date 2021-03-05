//
//  Film.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/4/21.
//

import Foundation

struct FilmDescription {
    var title: String
    var subtitle: [String]
    
    static func getArrayFromFilms(_ film: FilmData) -> [FilmDescription] {
        var filmDescriptionArray = [FilmDescription]()
        
        if let title = film.title, title.isEmpty == false {
            filmDescriptionArray.append(FilmDescription(title: "Title:", subtitle: [title]))
        }
        
        if let episodeID = film.episodeID {
            filmDescriptionArray.append(FilmDescription(title: "Episode ID:", subtitle: ["\(episodeID)"]))
        }
        
        if let openingCrawl = film.openingCrawl, openingCrawl.isEmpty == false {
            filmDescriptionArray.append(FilmDescription(title: "Opening Crawl:", subtitle: [openingCrawl]))
        }
        
        if let director = film.director, director.isEmpty == false {
            filmDescriptionArray.append(FilmDescription(title: "Director:", subtitle: [director]))
        }
        
        if let produer = film.producer, produer.isEmpty == false {
            filmDescriptionArray.append(FilmDescription(title: "Producer:", subtitle: [produer]))
        }
        
        if let releaseDate = film.releaseDate, releaseDate.isEmpty == false {
            filmDescriptionArray.append(FilmDescription(title: "Release Date", subtitle: [releaseDate]))
        }
        
        if let characters = film.characters, characters.isEmpty == false {
            filmDescriptionArray.append(FilmDescription(title: "Characters:", subtitle: characters))
        }
        
        if let planets = film.planets, planets.isEmpty == false {
            filmDescriptionArray.append(FilmDescription(title: "Planets:", subtitle: planets))
        }
        
        if let starships = film.starships, starships.isEmpty == false {
            filmDescriptionArray.append(FilmDescription(title: "Starships", subtitle: starships))
        }

        if let vehicles = film.vehicles, vehicles.isEmpty == false {
            filmDescriptionArray.append(FilmDescription(title: "Vehicles:", subtitle: vehicles))
        }
        
        if let species = film.species, species.isEmpty == false {
            filmDescriptionArray.append(FilmDescription(title: "Species:", subtitle: species))
        }
        
        if let created = film.created, created.isEmpty == false {
            filmDescriptionArray.append(FilmDescription(title: "Created:", subtitle: [created]))
        }
        
        if let edited = film.edited, edited.isEmpty == false {
            filmDescriptionArray.append(FilmDescription(title: "Edited:", subtitle: [edited]))
        }
        
        if let url = film.url, url.isEmpty == false {
            filmDescriptionArray.append(FilmDescription(title: "URL:", subtitle: [url]))
        }
        
        return filmDescriptionArray
    }
}
