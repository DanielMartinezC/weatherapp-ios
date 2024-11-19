//
//  ThemeProvider.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

public class ThemeProvider: ObservableObject {
    @Published public var theme: Theme = DefaultTheme()
    
    public static var shared = ThemeProvider()
    
    private init() {}
}

// MARK: - Public Methods
public extension ThemeProvider {
    func setTheme(_ theme: Theme) {
        self.theme = theme
    }
    
    func changeScheme(_ scheme: ColorScheme) {
        theme.colorTheme = scheme == .light
        ? theme.schemes.lightScheme
        : theme.schemes.darkScheme
    }
    
    func changeAppIcon(_ newIcon: String) {
        let currentIcon = UIApplication.shared.alternateIconName
        guard  currentIcon != newIcon
        else {
            return
        }
        
        if (currentIcon?.hasSuffix("Dark") ?? false) && !newIcon.hasSuffix("Dark") {
            UIApplication.shared.setAlternateIconName(nil)
        } else {
            UIApplication.shared.setAlternateIconName(newIcon) { (error) in
                print(error?.localizedDescription ?? "Error changing app icon.")
            }
        }
    }
}
