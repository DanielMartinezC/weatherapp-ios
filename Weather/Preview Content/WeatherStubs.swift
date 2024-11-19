//
//  WeatherStubs.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import SwiftUI

class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    private init() {}
    
    let weatherWithRainAndSnow = CurrentWeatherDetailModel(
        location: .city(city: City(id: "montevideo", name: "Montevideo", latitude: -34.9011, longitude: -56.1645)),
        item: CurrentWeatherResponse(
            name: "Montevideo",
            main: CurrentWeatherResponse.Main(
                temp: 5.6,
                feelsLike: 3.47,
                tempMin: 4.99,
                tempMax: 6.66,
                pressure: 1027,
                humidity: 90
            ),
            weather: [
                CurrentWeatherResponse.Weather(
                    description: "moderate rain",
                    iconName: .clouds
                )
            ],
            visibility: 10000,
            wind: CurrentWeatherResponse.Wind(speed: 2.57, deg: 40),
            clouds: CurrentWeatherResponse.Clouds(all: 92),
            sys: CurrentWeatherResponse.Sys(sunrise: 1731568648, sunset: 1731600763),
            rain: CurrentWeatherResponse.Rain(oneHour: 3.14),
            snow: CurrentWeatherResponse.Snow(oneHour: 1.32)
            )
        )
    
    let weatherWithoutRainAndSnow = CurrentWeatherDetailModel(
        location: .city(city: City(id: "montevideo", name: "Montevideo", latitude: -34.9011, longitude: -56.1645)),
        item: CurrentWeatherResponse(
            name: "Montevideo",
            main: CurrentWeatherResponse.Main(
                temp: 5.6,
                feelsLike: 3.47,
                tempMin: 4.99,
                tempMax: 6.66,
                pressure: 1027,
                humidity: 90
            ),
            weather: [
                CurrentWeatherResponse.Weather(
                    description: "moderate rain",
                    iconName: .clouds
                )
            ],
            visibility: 10000,
            wind: CurrentWeatherResponse.Wind(speed: 2.57, deg: 40),
            clouds: CurrentWeatherResponse.Clouds(all: 92),
            sys: CurrentWeatherResponse.Sys(sunrise: 1731568648, sunset: 1731600763)
            )
        )
    
    let locationWeatherItem = LocationWeatherItemModel(
        location: .city(city: City(id: "montevideo", name: "Montevideo", latitude: -34.9011, longitude: -56.1645)),
        item: CurrentWeatherResponse(
            name: "Montevideo",
            main: CurrentWeatherResponse.Main(
                temp: 5.6,
                feelsLike: 3.47,
                tempMin: 4.99,
                tempMax: 6.66,
                pressure: 1027,
                humidity: 90
            ),
            weather: [
                CurrentWeatherResponse.Weather(
                    description: "moderate rain",
                    iconName: .rain
                )
            ],
            visibility: 10000,
            wind: CurrentWeatherResponse.Wind(speed: 2.57, deg: 40),
            clouds: CurrentWeatherResponse.Clouds(all: 92),
            sys: CurrentWeatherResponse.Sys(sunrise: 1731568648, sunset: 1731600763),
            rain: CurrentWeatherResponse.Rain(oneHour: 3.14),
            snow: CurrentWeatherResponse.Snow(oneHour: 1.32)
            )
        )
    
    let forecastViewSuccess1 = CurrentWeatherResponse.Main(
        temp: 5.6,
        feelsLike: 3.47,
        tempMin: 4.99,
        tempMax: 6.66,
        pressure: 1027,
        humidity: 90
    )
}


extension PreviewProvider {
    
  static var dev: DeveloperPreview {
      return DeveloperPreview.shared
  }
    
}
