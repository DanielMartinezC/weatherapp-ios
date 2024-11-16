//
//  CurrentAirPollutionDetailModel.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import Foundation

struct CurrentAirPollutionDetailModel {
    private let item: AirPollutionResponse
    private(set) var locationName: String
    
    var aqi: String? {
        if let aqi = item.list.first?.main.aqi {
            return String(format: "%d", aqi)
        }
        return nil
    }
    
    var aqiNumber: Int? {
        if let aqi = item.list.first?.main.aqi {
            return aqi
        }
        return nil
    }
    
    var risk: String? {
        if let aqi = item.list.first?.main.aqi {
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

    init(locationName: String, item: AirPollutionResponse) {
        self.item = item
        self.locationName = locationName
    }
}
