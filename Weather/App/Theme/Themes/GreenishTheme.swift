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
        return Color(
            uiColor: .systemGreen.resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .dark)
            )
        )
    }
    
    var bottomSheetBackground1: Color {
        return elevatedBackground
    }
    
    var elevatedBackground: Color {
        return Color(
            uiColor: .systemYellow.resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .dark)
            )
        )
    }
    
    var weatherWidgetBackground: Color {
        return Color(
            uiColor: .systemYellow.withAlphaComponent(0.7).resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .dark)
            )
        )
    }
    
    var background2: Color {
        return Color(
            uiColor: .systemGreen.resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .dark)
            )
        )
    }
    
    var bottomSheetBackground2: Color {
        return elevatedBackground
    }
    
    var tabBarBackground1: Color {
        return Color(
            uiColor: .systemGreen.withAlphaComponent(0.5).resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .dark)
            )
        )
    }
    
    var tabBarBackground2: Color {
        return Color(
            uiColor: .systemGreen.withAlphaComponent(0.7).resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .dark)
            )
        )
    }
    
    var primary: Color {
        return Color(
            uiColor: .systemGreen.resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .dark)
            )
        )
    }
    
    var secondary: Color {
        return Color(uiColor:
            .systemGreen.withAlphaComponent(0.7).resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .dark)
            )
        )
    }
    
    var title: Color {
        return Color.schemeColor(for: .titles, scheme: .dark)
    }
    
    var subtitle: Color {
        return Color.schemeColor(for: .subtitles, scheme: .dark)
    }
    
    var body: Color {
        return Color.schemeColor(for: .texts, scheme: .dark)
    }
    
    var label: Color {
        return Color.schemeColor(for: .texts, scheme: .dark)
    }
    
    var regularText: Color {
        return Color.schemeColor(for: .texts, scheme: .dark)
    }
    
    var shadow: Color {
        return Color.schemeColor(for: .shadow, scheme: .dark)
    }
}

struct GreenishColorTheme: ColorTheme {
    var background1: Color {
        return Color(
            uiColor: .systemGreen.resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .light)
            )
        )
    }
    
    var bottomSheetBackground1: Color {
        return elevatedBackground
    }
    
    var elevatedBackground: Color {
        return Color(
            uiColor: .systemYellow.resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .light)
            )
        )
    }
    
    var background2: Color {
        return Color(
            uiColor: .systemGreen.resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .light)
            )
        )
    }
    
    var bottomSheetBackground2: Color {
        return elevatedBackground
    }
    
    var weatherWidgetBackground: Color {
        return Color(
            uiColor: .systemYellow.withAlphaComponent(0.7).resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .light)
            )
        )
    }
    
    var tabBarBackground1: Color {
        return Color(
            uiColor: .systemGreen.withAlphaComponent(0.5).resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .light)
            )
        )
    }
    
    var tabBarBackground2: Color {
        return Color(
            uiColor: .systemGreen.withAlphaComponent(0.7).resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .dark)
            )
        )
    }
    
    var primary: Color {
        return Color(
            uiColor: .systemGreen.resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .light)
            )
        )
    }
    
    var secondary: Color {
        return Color(uiColor:
            .systemGreen.withAlphaComponent(0.7).resolvedColor(
                with: UITraitCollection(userInterfaceStyle: .light)
            )
        )
    }
    
    var title: Color {
        return Color.schemeColor(for: .titles, scheme: .light)
    }
    
    var subtitle: Color {
        return Color.schemeColor(for: .subtitles, scheme: .light)
    }
    
    var body: Color {
        return Color.schemeColor(for: .texts, scheme: .light)
    }
    
    var label: Color {
        return Color.schemeColor(for: .texts, scheme: .light)
    }
    
    var regularText: Color {
        return Color.schemeColor(for: .texts, scheme: .light)
    }
    
    var shadow: Color {
        return Color.schemeColor(for: .shadow, scheme: .light)
    }
}

struct GreenishFontTheme: FontTheme {
    
    var titleFont: Font {
        return Font.custom(Fonts.bold.rawValue, size: 40)
    }
    
    var subtitleFont: Font {
        return Font.custom(Fonts.bold.rawValue, size: 24)
    }
    
    var headlineFont: Font {
        return Font.custom(Fonts.bold.rawValue, size: 18)
    }
    
    var bodyFont: Font {
        return Font.custom(Fonts.regular.rawValue, size: 16)
    }
    
    var buttonFont: Font {
        return Font.custom(Fonts.medium.rawValue, size: 16)
    }
    
    var labelFont: Font {
        return Font.custom(Fonts.medium.rawValue, size: 16)
    }
}
