//
//  WeatherRepository+Mock.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

class WeatherRepositoryMock: WeatherRepository {
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
private extension WeatherRepositoryMock {
    func getCurrentWeatherSuccessResponse() -> CurrentWeatherResponse? {
        let responseString = """
        {
          "weather": [
            {
              "main": "Clouds",
              "description": "moderate rain",
            }
          ],
          "main": {
            "temp": 5.6,
            "feels_like": 3.57,
            "temp_min": 4.99,
            "temp_max": 6.66,
            "pressure": 1027,
            "humidity": 90
          },
          "name": "Zocca",
          "visibility":10000,
          "wind": {
            "speed": 2.57,
            "deg": 40
          },
          "clouds": {
            "all": 92
          },
          "sys": {
            "sunrise": 1731568648,
            "sunset": 1731600763
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
                "aqi":1
              },
              "components":{
                "co":201.94053649902344,
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
