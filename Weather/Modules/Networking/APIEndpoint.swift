//
//  APIEndpoint.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

enum APIEndpoint {
    case weatherForCoordinates(latitute: Double, longitude: Double)
    case weatherForCity(city: String)
    case airPollutionForCoordinates(latitute: Double, longitude: Double)
}

extension APIEndpoint {
    var path: String {
        switch self {
        case .weatherForCoordinates, .weatherForCity:
            return "/weather"
        case .airPollutionForCoordinates:
            return "/air_pollution"
        }
    }
    
    var method: Method {
        switch self {
        case .weatherForCoordinates:
            return .GET
        case .weatherForCity:
            return .GET
        case .airPollutionForCoordinates:
            return .GET
        default:
            return .POST
        }
    }
    
    var queryParameters: [URLQueryItem]? {
        switch self {
        case .weatherForCoordinates(let latitute, let longitude):
            let latQueryItem = URLQueryItem(name: "lat", value: "\(latitute)")
            let lonQueryItem = URLQueryItem(name: "lon", value: "\(longitude)")
            let unitsQueryItem = URLQueryItem(name: "units", value: "metric")
            return [latQueryItem, lonQueryItem, unitsQueryItem]
        case .weatherForCity(let city):
            let cityQueryItem = URLQueryItem(name: "q", value: "\(city)")
            let unitsQueryItem = URLQueryItem(name: "units", value: "metric")
            return [cityQueryItem, unitsQueryItem]
        case .airPollutionForCoordinates(let latitute, let longitude):
            let latQueryItem = URLQueryItem(name: "lat", value: "\(latitute)")
            let lonQueryItem = URLQueryItem(name: "lon", value: "\(longitude)")
            let unitsQueryItem = URLQueryItem(name: "units", value: "metric")
            return [latQueryItem, lonQueryItem, unitsQueryItem]
        default:
            return nil
        }
    }
    
    func encodeParameters(into request: URLRequest) throws -> URLRequest {
        switch self {
        default:
            return request
        }
    }
    
    enum Method: String {
        case GET
        case POST
        case PUT
        case DELETE
    }
}
