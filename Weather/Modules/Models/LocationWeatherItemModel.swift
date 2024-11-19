//
//  LocationWeatherItemModel.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import Foundation

struct LocationWeatherItemModel: Identifiable, Hashable {
    private let item: CurrentWeatherResponse
    var location: WeatherLocation

    var id: String {
        location.id
    }
    
    var temperature: String {
        return String(format: "%.1fº", item.main.temp)
    }
    
    var maxTemperature: String {
        return String(format: "%.1fº", item.main.tempMax)
    }

    var minTemperature: String {
        return String(format: "%.1fº", item.main.tempMin)
    }
    
    var description: String {
        return item.weather.first?.description.capitalized ?? String.empty
    }
    
    var icon: String? {
        return item.weather.first?.iconName.systemName
    }
    
    init(location: WeatherLocation, item: CurrentWeatherResponse) {
        self.item = item
        self.location = location
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(location)
    }
    
    static func == (lhs: LocationWeatherItemModel, rhs: LocationWeatherItemModel) -> Bool {
        lhs.id == rhs.id
    }
}
