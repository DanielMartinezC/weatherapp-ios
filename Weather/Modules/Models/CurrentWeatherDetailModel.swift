//
//  CurrentWeatherDetailModel.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import Foundation

struct CurrentWeatherDetailModel {
    private let item: CurrentWeatherResponse
    private(set) var locationName: String
    
    var temperature: String {
      return String(format: "%.1fº", item.main.temp)
    }

    var maxTemperature: String {
      return String(format: "%.1fº", item.main.tempMax)
    }

    var minTemperature: String {
      return String(format: "%.1fº", item.main.tempMin)
    }
    
    var temperatureFeelsLike: String {
        return String(format: "%.1fº", item.main.feelsLike)
    }

    var description: String {
        return item.weather.first?.description.capitalized ?? String.empty
    }
    
    var humidity: String {
        return String(format: "%d %", item.main.humidity)
    }
    
    var pressure: String {
        return String(format: "%d hPa", item.main.pressure)
    }
    
    var windSpeed: String {
        return String(format: "%.2f m/s", item.wind.speed)
    }
    
    var sunrise: String {
        return item.sys.sunrise.timestampToHMMA()
    }
    
    var sunset: String {
        return item.sys.sunset.timestampToHMMA()
    }
    
    var visibility: String {
        return String(format: "%d km", item.visibility/1000)
    }
    
    var rain: String? {
        guard let rain = item.rain else {
            return nil
        }
        return String(format: "%.2f mm/h", rain.oneHour)
    }
    
    var snow: String? {
        guard let snow = item.snow else {
            return nil
        }
        return String(format: "%.2f mm/h", snow.oneHour)
    }

    enum WeatherDetailInfo: Hashable {
        case humidity
        case minTemperature
        case maxTemperature
        case temperature
    }

    var weatherDetails: Array<String> {
        [humidity, minTemperature, maxTemperature, temperature]
    }

    init(locationName: String, item: CurrentWeatherResponse) {
        self.item = item
        self.locationName = locationName
    }
}
