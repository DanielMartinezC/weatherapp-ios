//
//  WeatherRepository.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

protocol WeatherRepository {
    func
    getCurrentWeather(for latitude: Double, and longitude: Double) async throws -> CurrentWeatherResponse
    func
    getCurrentWeather(for city: String) async throws -> CurrentWeatherResponse
    func
    getAirPollution(for latitude: Double, and longitude: Double) async throws -> AirPollutionResponse
}
