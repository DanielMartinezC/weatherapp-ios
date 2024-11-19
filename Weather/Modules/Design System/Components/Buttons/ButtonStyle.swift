//
//  ButtonStyle.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 18/11/24.
//

import SwiftUI

public struct FilledButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    @EnvironmentObject private var themeProvider: ThemeProvider
    private var width: CGFloat = .infinity
    
    private var backgroundColor: Color {
        return isEnabled
        ? themeProvider.theme.colorTheme.primary
        : themeProvider.theme.colorTheme.primary.opacity(0.3)
    }
    
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonLabelStyle(foregroundColor: themeProvider.theme.colorTheme.label)
            .frame(maxWidth: width)
            .padding(themeProvider.theme.buttonTheme.padding)
            .background(
                RoundedRectangle(cornerRadius: themeProvider.theme.buttonTheme.cornerRadius)
                    .fill(backgroundColor)
                    .frame(height: themeProvider.theme.buttonTheme.height)
            )
    }
}

public struct BorderButtonStyle: ButtonStyle {
    @EnvironmentObject private var themeProvider: ThemeProvider
    @Environment(\.isEnabled) var isEnabled
    private var width: CGFloat = .infinity
    
    private var color: Color {
        return isEnabled
        ? themeProvider.theme.colorTheme.primary
        : themeProvider.theme.colorTheme.primary.opacity(0.3)
    }
    
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonLabelStyle(foregroundColor: color)
            .frame(maxWidth: width)
            .padding(themeProvider.theme.buttonTheme.padding)
            .background(
                RoundedRectangle(cornerRadius: themeProvider.theme.buttonTheme.cornerRadius)
                    .strokeBorder(color, lineWidth: themeProvider.theme.buttonTheme.borderWidth)
                    .frame(height: themeProvider.theme.buttonTheme.height)
                    .background(.clear)
            )
            .contentShape(RoundedRectangle(cornerRadius: themeProvider.theme.buttonTheme.cornerRadius))
    }
}

