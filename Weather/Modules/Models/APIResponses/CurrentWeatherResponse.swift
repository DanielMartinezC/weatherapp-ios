//
//  CurrentWeatherResponse.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

struct CurrentWeatherResponse: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let sys: Sys
    var rain: Rain? = nil
    var snow: Snow? = nil
    
    struct Main: Codable {
        let temp: Double
        let feelsLike: Double
        let tempMin: Double
        let tempMax: Double
        let pressure: Int
        let humidity: Int

        enum CodingKeys: String, CodingKey {
            case temp, pressure, humidity
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
        }
    }
    
    struct Weather: Codable {
        let description: String
        let iconName: Icon
        
        enum CodingKeys: String, CodingKey {
            case description
            case iconName = "main"
        }
        
        enum Icon: String, Codable {
            case clear = "Clear"
            case clouds = "Clouds"
            case rain = "Rain"
            case mist = "Mist"
            case snow = "Snow"
            case thunderstorm = "Thunderstorm"
            case drizzle = "Drizzle"
            case atmosphere = "Atmosphere" // Generic for group 7xx like Mist, Smoke, etc.
            
            var systemName: String {
                switch self {
                case .clear:
                    return "sun.max"
                case .clouds:
                    return "cloud.fill"
                case .rain:
                    return "cloud.rain"
                case .mist:
                    return "cloud.fog"
                case .snow:
                    return "cloud.snow"
                case .thunderstorm:
                    return "cloud.bolt.rain"
                case .drizzle:
                    return "cloud.drizzle"
                case .atmosphere:
                    return "smoke.fill" // Example for atmospheric conditions
                }
            }
        }
    }
    
    struct Wind: Codable {
        let speed: Double
        let deg: Int
    }
    
    struct Clouds: Codable {
        let all: Int
    }
    
    struct Sys: Codable {
        let sunrise: Int
        let sunset: Int
    }
    
    struct Rain: Codable {
        let oneHour: Double

        enum CodingKeys: String, CodingKey {
            case oneHour = "1h"
        }
    }
    
    struct Snow: Codable {
        let oneHour: Double

        enum CodingKeys: String, CodingKey {
            case oneHour = "1h"
        }
    }
}
