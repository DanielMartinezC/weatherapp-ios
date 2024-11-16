//
//  ViewModifier+ColorScheme.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

public struct ColorSchemeModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    public func body(content: Content) -> some View {
        content
            .onChange(of: colorScheme) { newValue in
                ThemeProvider.shared.changeScheme(newValue)
            }
    }
}

public extension View {
    func withColorScheme() -> some View {
        modifier(ColorSchemeModifier())
    }
}
