//
//  CurrentWeatherDetailModel.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import Foundation

struct CurrentWeatherDetailModel {
    private(set) var location: WeatherLocation
    private let item: CurrentWeatherResponse
    private let pollution: AirPollutionResponse?
    private let temperatureRange: Double = 2.0
    
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
    
    var temperatureFeelsLikeDescription: String {
        if item.main.feelsLike < (item.main.temp - temperatureRange) {
            return item.wind.speed > 5 ? "Wind is making it feel cooler." : "It's a bit chilly."
        } else if item.main.feelsLike > (item.main.temp + temperatureRange) {
            return "The temperature feels warmer than it actually is."
        } else {
            return  "Similar to the actual temperature."
        }
    }

    var description: String {
        return item.weather.first?.description.capitalized ?? String.empty
    }
    
    var humidity: String {
        return String(format: "%d %", item.main.humidity)
    }
    
    var dewPointDescription: String {
        let a = 17.27
        let b = 237.7

        let gamma = log(Double(item.main.humidity)/100) + (a * item.main.temp) / (b + item.main.temp)
        let dewPoint = (b * gamma) / (a - gamma)
        
        return String(format: "The dew point is %.1fº right now.", dewPoint)
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
    
    var visibilityDescription: String {
        if item.visibility >= 10000 {
            return "Perfectly clear view."
        } else {
            return "Something is affecting visibility."
        }
    }
    
    var rain: String {
        return String(format: "%.2f mm", item.rain?.oneHour ?? 0)
    }
    
    var snow: String {
        return String(format: "%.2f mm", item.snow?.oneHour ?? 0)
    }
    
    var aqi: String? {
        if let aqi = pollution?.list.first?.main.aqi {
            return String(format: "%d", aqi)
        }
        return nil
    }
    
    var aqiNumber: Int? {
        if let aqi = pollution?.list.first?.main.aqi {
            return aqi
        }
        return nil
    }
    
    var risk: String? {
        if let aqi = pollution?.list.first?.main.aqi {
            switch aqi {
            case 1:
                return "Very Low"
            case 2:
                return "Low"
            case 3:
                return "Moderate"
            case 4:
                return "High"
            case 5:
                return "Very High"
            default:
                return "Undefined"
            }
        }
        return nil
    }

    init(location: WeatherLocation, item: CurrentWeatherResponse, pollution: AirPollutionResponse? = nil) {
        self.item = item
        self.location = location
        self.pollution = pollution
    }
}
