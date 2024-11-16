//
//  WeatherLocationsBuilder.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

enum WeatherLocationsBuilder {
  
    @MainActor
    static func makeWeatherLocationsView() -> some View {
        let viewModel = WeatherLocationsViewModel()
        return WeatherLocationsView(viewModel: viewModel)
    }
}

