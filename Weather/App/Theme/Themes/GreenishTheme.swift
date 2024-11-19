//
//  GreenishTheme.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

struct GreenishTheme: Theme {

    var colorTheme: ColorTheme = GreenishColorTheme()
    
    var schemes: Schemes {
        return GreenishSchemes()
    }
    
    var fontTheme: FontTheme {
        return GreenishFontTheme()
    }
    
    public var buttonTheme: ButtonTheme {
        return DefaultTheme().buttonTheme
    }
    
    var iconTheme: IconTheme {
        return DefaultTheme().iconTheme
    }
    
}

struct GreenishSchemes: Schemes {
    
    var lightScheme: ColorTheme {
        return GreenishColorTheme()
    }
    
    var darkScheme: ColorTheme {
        return GreenishDarkColorTheme()
    }
}

struct GreenishDarkColorTheme: ColorTheme {
    var background1: Color {
        return Color(red: 28/255, green: 43/255, blue: 41/255).opacity(0.7)
    }
    
    var background2: Color {
        return Color(red: 28/255, green: 43/255, blue: 41/255)
    }
    
    var bottomSheetBackground: Color {
        return elevatedBackground
    }
    
    var elevatedBackground: Color {
        return Color(red: 15/255, green: 26/255, blue: 24/255)
    }
    
    var weatherWidgetBackground: Color {
        return Color(red: 99/255, green: 216/255, blue: 192/255)
    }
    
    var tabBarIcon: Color {
        return Color(red: 85/255, green: 96/255, blue: 94/255)
    }
    
    var primary: Color {
        return Color(red: 99/255, green: 216/255, blue: 192/255)
    }
    
    var secondary: Color {
        return Color(red: 212/255, green: 230/255, blue: 81/255)
    }
    
    var title: Color {
        return Color.schemeColor(for: .titles, scheme: .light)
    }
    
    var body: Color {
        return Color.schemeColor(for: .texts, scheme: .light)
    }
    
    var label: Color {
        return Color.schemeColor(for: .texts, scheme: .light)
    }
    
    var shadow: Color {
        return Color.schemeColor(for: .shadow, scheme: .light)
    }
    
    var border: Color {
        return Color.schemeColor(for: .borders, scheme: .light)
    }
    
    var navigationText: Color {
        return Color.schemeColor(for: .navigationText, scheme: .dark)
    }
}

struct GreenishColorTheme: ColorTheme {
    var background1: Color {
        return .white
    }
    
    var background2: Color {
        return Color(red: 28/255, green: 43/255, blue: 41/255).opacity(0.5)
    }
    
    var bottomSheetBackground: Color {
        return elevatedBackground
    }
    
    var elevatedBackground: Color {
        return Color(red: 15/255, green: 26/255, blue: 24/255)
    }
    
    var weatherWidgetBackground: Color {
        return Color(red: 99/255, green: 216/255, blue: 192/255)
    }
    
    var tabBarIcon: Color {
        return Color(red: 15/255, green: 26/255, blue: 24/255)
    }
    
    var primary: Color {
        return Color(red: 99/255, green: 216/255, blue: 192/255)
    }
    
    var secondary: Color {
        return Color(red: 212/255, green: 230/255, blue: 81/255)
    }
    
    var title: Color {
        return  Color(red: 28/255, green: 43/255, blue: 41/255)
    }
    
    var body: Color {
        return  Color(red: 28/255, green: 43/255, blue: 41/255)
    }
    
    var label: Color {
        return  Color(red: 28/255, green: 43/255, blue: 41/255)
    }
    
    var shadow: Color {
        return Color.schemeColor(for: .shadow, scheme: .light)
    }
    
    var border: Color {
        return Color(red: 28/255, green: 43/255, blue: 41/255).opacity(0.3)
    }
    
    var navigationText: Color {
        return Color.schemeColor(for: .navigationText, scheme: .light)
    }
}

struct GreenishFontTheme: FontTheme {
    
    var titleFont: Font {
        return Font.custom(Fonts.bold.rawValue, size: 36)
    }
    
    var subtitleFont: Font {
        return Font.custom(Fonts.bold.rawValue, size: 24)
    }
    
    var headlineFont: Font {
        return Font.custom(Fonts.bold.rawValue, size: 96)
    }
    
    var bodyFont: Font {
        return Font.custom(Fonts.regular.rawValue, size: 24)
    }
    
    var buttonFont: Font {
        return Font.custom(Fonts.medium.rawValue, size: 16)
    }
    
    var labelFont: Font {
        return Font.custom(Fonts.medium.rawValue, size: 14)
    }
    
    var captionFont: Font {
        return Font.custom(Fonts.medium.rawValue, size: 12)
    }
}
