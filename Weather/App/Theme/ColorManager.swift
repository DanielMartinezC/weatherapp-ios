//
//  ColorManager.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

extension Color {
    enum WeatherColor: String {
        case primary
        case secondary
        // Grayscale
        case subtitles
        case texts
        case titles
        case shadow
    }
    
    static func schemeColor(for color: WeatherColor, scheme: UIUserInterfaceStyle) -> Color {
        let color = UIColor(named: color.rawValue)?
            .resolvedColor(
                with: UITraitCollection(userInterfaceStyle: scheme)
            ) ?? .black
        return Color(color)
    }
}
