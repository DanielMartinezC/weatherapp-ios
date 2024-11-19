//
//  LocationWeatherDetailBuilder.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import SwiftUI

enum WeatherDetailBuilder {
  
    @MainActor
    static func makeWeatherDetailView(for location: WeatherLocation) -> some View {
        let viewModel = WeatherDetailViewModel(for: location)
        return WeatherDetailView(viewModel: viewModel)
    }
}
