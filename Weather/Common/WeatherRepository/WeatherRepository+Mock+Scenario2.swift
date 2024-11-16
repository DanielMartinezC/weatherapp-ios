//
//  WeatherRepository+Mock+Scenario2.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

class WeatherRepositoryMockSecondScenario: WeatherRepository {
    
    func getAirPollution(for latitude: Double, and longitude: Double) async throws -> AirPollutionResponse {
        await Utils.setupTimerIfNeeded()
        if let response = airPollutionSuccessResponse() {
            return response
        } else {
            throw CustomError.mockError
        }
    }
    
    func getCurrentWeather(for latitude: Double, and longitude: Double) async throws -> CurrentWeatherResponse {
        await Utils.setupTimerIfNeeded()
        if let response = getCurrentWeatherSuccessResponse() {
            return response
        } else {
            throw CustomError.mockError
        }
    }
    
    func getCurrentWeather(for city: String) async throws -> CurrentWeatherResponse {
        await Utils.setupTimerIfNeeded()
        if let response = getCurrentWeatherSuccessResponse() {
            return response
        } else {
            throw CustomError.mockError
        }
    }
}

// MARK: - Helpers
private extension WeatherRepositoryMockSecondScenario {
    func getCurrentWeatherSuccessResponse() -> CurrentWeatherResponse? {
        let responseString = """
        {
          "weather": [
            {
              "main": "Rain",
              "description": "moderate rain",
            }
          ],
          "main": {
            "temp": 10.48,
            "feels_like": 8.74,
            "temp_min": 6.56,
            "temp_max": 12.05,
            "pressure": 1015,
            "humidity": 80
          },
          "name": "London",
          "visibility":10000,
          "wind": {
            "speed": 2.57,
            "deg": 30
          },
          "clouds": {
            "all": 100
          },
          "sys": {
            "sunrise": 1731568648,
            "sunset": 1731600763
          },
          "rain": {
            "1h": 2.47
          },
          "snow": {
            "1h": 1.10
          }
        }
        """
        return try? responseString.decode(toObject: CurrentWeatherResponse.self)
    }
    
    func airPollutionSuccessResponse() -> AirPollutionResponse? {
        let responseString = """
        {
          "list":[
            {
              "dt":1605182400,
              "main":{
                "aqi":4
              },
              "components":{
                "co":100.94053649902344,
                "no":0.01877197064459324,
                "no2":0.7711350917816162,
                "o3":68.66455078125,
                "so2":0.6407499313354492,
                "pm2_5":0.5,
                "pm10":0.540438711643219,
                "nh3":0.12369127571582794
              }
            }
          ]
        }
        """
        return try? responseString.decode(toObject: AirPollutionResponse.self)
    }
}
