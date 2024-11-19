//
//  WeatherRepository+Imp.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

class WeatherRepositoryImp: WeatherRepository {
    func getAirPollution(for latitude: Double, and longitude: Double) async throws -> AirPollutionResponse {
        do {
            let response: AirPollutionResponse = try await APIClient.shared.performRequest(
                from: .airPollutionForCoordinates(latitute: latitude, longitude: longitude)
            )
            return response
        } catch {
            throw error
        }
    }
    
    func getCurrentWeather(for latitude: Double, and longitude: Double) async throws -> CurrentWeatherResponse {
        do {
            let response: CurrentWeatherResponse = try await APIClient.shared.performRequest(
                from: .weatherForCoordinates(latitute: latitude, longitude: longitude)
            )
            return response
        } catch {
            throw error
        }
    }

    func getCurrentWeather(for city: String) async throws -> CurrentWeatherResponse {
        do {
            let response: CurrentWeatherResponse = try await APIClient.shared.performRequest(
                from: .weatherForCity(city: city)
            )
            return response
        } catch {
            throw error
        }
    }
}
