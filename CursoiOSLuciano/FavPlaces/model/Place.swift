//
//  Place.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 11/02/2025.
//

import Foundation
import MapKit

struct Place: Identifiable, Codable{
    var id = UUID()
    var name: String
    var coordinates: CLLocationCoordinate2D
    var fav: Bool
    
    enum CodingKeys: CodingKey{
        case id, name, latitude, longitude, fav
    }
    
    init(id: UUID = UUID(), name: String, coordinates: CLLocationCoordinate2D, fav: Bool) {
        self.id = id
        self.name = name
        self.coordinates = coordinates
        self.fav = fav
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        
        coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        fav = try container.decode(Bool.self, forKey: .fav)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(coordinates.latitude, forKey: .latitude)
        try container.encode(coordinates.longitude, forKey: .longitude)
        try container.encode(fav, forKey: .fav)
    }
}
