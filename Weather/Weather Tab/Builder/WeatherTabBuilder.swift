//
//  WeatherTabBuilder.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import SwiftUI

enum WeatherTabBuilder {
  
    @MainActor
    static func makeWeatherTabView() -> some View {
        let viewModel = WeatherTabViewModel()
        let tabBarSettings = TabBarSettings()
        return WeatherTabView(viewModel: viewModel, tabBarSettings: tabBarSettings)
    }
}
