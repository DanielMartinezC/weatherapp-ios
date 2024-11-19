//
//  WeatherLocation+Localization.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 18/11/24.
//

import Foundation

extension String {
    static let weatherLocationTitle = String(localized: "Weather", bundle: .main)
    static let noWeatherData = String(localized: "No data", bundle: .main)
    static let noWeatherDataHelpMessage = String(
        localized: "We could get any weather information for your locations. Please check your internet connection and try again.",
        bundle: .main
    )
    static let retry = String(localized: "Retry", bundle: .main)
}
