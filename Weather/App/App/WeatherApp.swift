//
//  WeatherApp.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import SwiftUI

@main
struct WeatherApp: App {
    
    // MARK: - Variables
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            mainView
                .environmentObject(appDelegate.appConfiguration.themeProvider)
                .withColorScheme()
        }
    }
}

// MARK: - Helpers
extension WeatherApp {
    var mainView: some View {
        WeatherTabBuilder.makeWeatherTabView()
    }
}
