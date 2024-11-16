//
//  WeatherThemes.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import Foundation

enum WeatherThemes: CaseIterable {
    case greenish
    case main
    
    var name: String {
        switch self {
        case .greenish:
            return "Greenish"
        case .main:
            return "Main"
        }
    }
    
    var theme: Theme {
        switch self {
        case .greenish:
            return GreenishTheme()
        case .main:
            return AppTheme()
        }
    }
    
}
