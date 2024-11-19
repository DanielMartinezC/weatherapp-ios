//
//  WeatherDetail+Localization.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 18/11/24.
//

import Foundation

extension String {
    static let locationUnauthorized = String(localized: "Location", bundle: .main)
    // swiftlint:disable line_length
    static let locationUnauthorizedHelpMessage = String(
        localized: "We need permission to access your location to provide the current weather. You can enable this in your device’s Settings.",
        bundle: .main
    )
    // swiftlint:enable line_length
    static let goToSettings = String(localized: "Go to settings", bundle: .main)
}
