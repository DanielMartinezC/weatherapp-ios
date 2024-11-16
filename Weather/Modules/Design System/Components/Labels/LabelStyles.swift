//
//  LabelStyles.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

struct TitleStyle: ViewModifier {
    @EnvironmentObject private var themeProvider: ThemeProvider
    
    func body(content: Content) -> some View {
        content
            .font(themeProvider.theme.fontTheme.titleFont)
            .foregroundColor(themeProvider.theme.colorTheme.title)
    }
}

struct SubTitleStyle: ViewModifier {
    @EnvironmentObject private var themeProvider: ThemeProvider
    
    let foregroundColor: Color?
    
    init(_ foregroundColor: Color? = nil) {
        self.foregroundColor = foregroundColor
    }
    
    func body(content: Content) -> some View {
        content
            .font(themeProvider.theme.fontTheme.subtitleFont)
            .foregroundColor(foregroundColor ?? themeProvider.theme.colorTheme.title)
    }
}

struct HeadingStyle: ViewModifier {
    @EnvironmentObject private var themeProvider: ThemeProvider
    
    let foregroundColor: Color?
    
    init(_ foregroundColor: Color? = nil) {
        self.foregroundColor = foregroundColor
    }
    
    func body(content: Content) -> some View {
        content
            .font(themeProvider.theme.fontTheme.headlineFont)
            .foregroundColor(foregroundColor ?? themeProvider.theme.colorTheme.title)
    }
}

struct BodyStyle: ViewModifier {
    @EnvironmentObject private var themeProvider: ThemeProvider
    
    let foregroundColor: Color?
    
    init(_ foregroundColor: Color? = nil) {
        self.foregroundColor = foregroundColor
    }
    
    func body(content: Content) -> some View {
        content
            .font(themeProvider.theme.fontTheme.bodyFont)
            .foregroundColor(foregroundColor ?? themeProvider.theme.colorTheme.body)
    }
}

struct LabelStyle: ViewModifier {
    @EnvironmentObject private var themeProvider: ThemeProvider
    
    let foregroundColor: Color?
    
    init(_ foregroundColor: Color? = nil) {
        self.foregroundColor = foregroundColor
    }
    
    func body(content: Content) -> some View {
        content
            .font(themeProvider.theme.fontTheme.labelFont)
            .foregroundColor(foregroundColor ?? themeProvider.theme.colorTheme.label)
    }
}
