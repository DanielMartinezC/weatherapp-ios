//
//  WeatherRepository+Mock+Failure.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import Foundation

class WeatherRepositoryMockFailure: WeatherRepository {
    
    func getAirPollution(for latitude: Double, and longitude: Double) async throws -> AirPollutionResponse {
        await Utils.setupTimerIfNeeded()
        throw CustomError.mockError
    }
    
    func getCurrentWeather(for latitude: Double, and longitude: Double) async throws -> CurrentWeatherResponse {
        await Utils.setupTimerIfNeeded()
        throw CustomError.mockError
    }
    
    func getCurrentWeather(for city: String) async throws -> CurrentWeatherResponse {
        await Utils.setupTimerIfNeeded()
        throw CustomError.mockError
    }
}
