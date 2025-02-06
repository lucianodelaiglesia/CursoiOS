//
//  ApiNetwork.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 04/02/2025.
//

import Foundation

class ApiNetwork{
    
    struct Wrapper: Codable{
        let response: String
        let results: [Superhero]
    }
    
    struct Superhero: Codable, Identifiable{
        let id: String
        let name: String
        let image: SuperheroImage
    }
    
    struct SuperheroImage: Codable{
        let url: String
    }
    
    struct SuperheroDetail: Codable{
        let id: String
        let name: String
        let image: SuperheroImage
        let powerstats: PowerStats
        let biography: Biography
    }
    
    struct PowerStats: Codable{
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    
    struct Biography: Codable{
        let fullName: String
        let aliases: [String]
        let publisher: String
        let alignment: String
        
        enum CodingKeys: String, CodingKey{
            case fullName = "full-name"
            case aliases = "aliases"
            case publisher = "publisher"
            case alignment = "alignment"
        }
    }
    
    struct Stat: Identifiable{
        let id = UUID()
        let name: String
        let value: String
    }
    
    func getHeroesByQuery(query: String) async throws -> Wrapper{
        let url = URL(string: "https://superheroapi.com/api/79c99fda9894cf4017793cdb40721cb6/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        
        return wrapper
    }
    
    func getHeroById(id: String) async throws -> SuperheroDetail{
        let url = URL(string: "https://superheroapi.com/api/79c99fda9894cf4017793cdb40721cb6/\(id)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(SuperheroDetail.self, from: data)
    }
    
    func getHeroStats(powerStats: PowerStats) -> [Stat]{
        return [
            Stat(name: "Intelligence", value: powerStats.intelligence),
            Stat(name: "Strength", value: powerStats.strength),
            Stat(name: "Speed", value: powerStats.speed),
            Stat(name: "Durability", value: powerStats.durability),
            Stat(name: "Power", value: powerStats.power),
            Stat(name: "Combat", value: powerStats.combat)
        ]
    }
}
