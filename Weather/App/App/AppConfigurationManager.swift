//
//  AppConfigurationManager.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import SwiftUI

class AppConfigurationManager {
    
    var themeProvider: ThemeProvider = ThemeProvider.shared
    var apiClient: APIClient = APIClient.shared
    
    init() {
        setupAPIClient()
    }
}

// MARK: - Public Methods
extension AppConfigurationManager {
    func configureTheme() {
        let theme = AppTheme()
        ThemeProvider.shared.setTheme(theme)
    }
    
    func changeTheme(_ theme: Theme) {
        ThemeProvider.shared.setTheme(theme)
        changeColorScheme(to: UITraitCollection.current.userInterfaceStyle)
    }
    
    func changeAppIcon(_ icon: String) {
        themeProvider.changeAppIcon(icon)
    }
    
    func changeColorScheme(to scheme: UIUserInterfaceStyle) {
        let colorScheme: ColorScheme = scheme == .light ? .light : .dark
        ThemeProvider.shared.changeScheme(colorScheme)
    }
    
    func setupAPIClient() {
        apiClient.setBaseURL(Config.sharedInstance.servicesURL())
        apiClient.setAPIKey(Config.sharedInstance.openWeatherAPIKey())
        
    }
}
