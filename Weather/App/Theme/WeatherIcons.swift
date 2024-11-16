//
//  WeatherIcons.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import Foundation

enum WeatherIcons: String, CaseIterable {
    case appIconDev = "AppIconDev"
    case appIcon = "AppIcon"
    case appIconDevDark = "AppIconDevDark"
    case appIconDark = "AppIconDark"
    
    static func getSchemeIcons() -> [String] {
        var schemeIcons = [String]()
        
        switch Config.sharedInstance.environment() {
        case Config.Environment.development:
            schemeIcons.append(WeatherIcons.appIconDev.rawValue)
            schemeIcons.append(WeatherIcons.appIconDevDark.rawValue)
         
        case Config.Environment.production:
            schemeIcons.append(WeatherIcons.appIcon.rawValue)
            schemeIcons.append(WeatherIcons.appIconDark.rawValue)
        }
        
        return schemeIcons
    }
}
