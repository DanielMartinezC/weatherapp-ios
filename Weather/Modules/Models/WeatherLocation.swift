//
//  WeatherLocation.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 13/11/24.
//

import Foundation

enum WeatherLocation: Identifiable, Hashable {
    case myLocation
    case city(city: City)
    
    var id: String {
        switch self {
        case .myLocation:
            return "myLocation"
        case .city(let city):
            return city.id
        }
    }
    
    var description: String {
        switch self {
        case .myLocation:
            return "My Location"
        case .city(let city):
            return city.name
        }
    }
}

extension WeatherLocation {
    static let availableLocations: [WeatherLocation] = [
        .myLocation,
        .city(city: City(id: "montevideo", name: "Montevideo", latitude: -34.9011, longitude: -56.1645)),
        .city(city: City(id: "buenosaires", name: "Buenos Aires", latitude: -34.6037, longitude: -58.3816)),
        .city(city: City(id: "london", name: "London", latitude: 51.5074, longitude: -0.1278))
    ]
}
