//
//  DefaultTheme.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

public struct DefaultTheme: Theme {
    public var colorTheme: ColorTheme = DefaultColorTheme()
    
    public var schemes: Schemes {
        return DefaultScheme()
    }
    
    public var fontTheme: FontTheme {
        return DefaultFontTheme()
    }
    
    public var buttonTheme: ButtonTheme {
        return DefaultButtonTheme()
    }
    
    public var iconTheme: IconTheme {
        return DefaultIconTheme()
    }
    
    public init() {}
}

struct DefaultScheme: Schemes {
    
    var lightScheme: ColorTheme {
        return DefaultColorTheme()
    }
    
    var darkScheme: ColorTheme {
        return DefaultDarkColorTheme()
    }
}

struct DefaultDarkColorTheme: ColorTheme {
    
    var background1: Color {
        return Color("background").opacity(0.7)
    }
    
    var background2: Color {
        return Color("background")
    }
    
    var bottomSheetBackground: Color {
        return Color("bottomSheetBackground").opacity(0.26)
    }
    
    var weatherWidgetBackground: Color {
        return Color("weatherWidgetBackground")
    }

    var tabBarIcon: Color {
        return Color("tabBarIcon")
    }
    
    var shadow: Color {
        return Color("shadow")
    }

    var secondary: Color {
        return Color("secondary")
    }

    var primary: Color {
        return Color("primary")
    }

    var title: Color {
        return Color("titles")
    }

    var body: Color {
        return Color("texts")
    }

    var label: Color {
        return Color("texts")
    }
    
    var border: Color {
        return Color("borders")
    }
    
    var navigationText: Color {
        return Color("navigationText")
    }
}

struct DefaultColorTheme: ColorTheme {
    
    var background1: Color {
        return Color("background").opacity(0.7)
    }
    
    var background2: Color {
        return Color("background")
    }

    var bottomSheetBackground: Color {
        return Color("bottomSheetBackground")
    }

    var weatherWidgetBackground: Color {
        return Color("weatherWidgetBackground")
    }
    
    var tabBarIcon: Color {
        return Color("tabBarIcon")
    }

    var shadow: Color {
        return Color("shadow")
    }

    var secondary: Color {
        return Color("secondary")
    }

    var primary: Color {
        return Color("primary")
    }

    var title: Color {
        return Color("titles")
    }

    var body: Color {
        return Color("texts")
    }

    var label: Color {
        return Color("texts")
    }
    
    var border: Color {
        return Color("borders")
    }
    
    var navigationText: Color {
        return Color("navigationText")
    }
}

struct DefaultFontTheme: FontTheme {
    var titleFont: Font {
        return Font.system(size: 40, weight: .bold)
    }

    var subtitleFont: Font {
        return Font.title3.weight(.semibold)
    }

    var headlineFont: Font {
        return Font.system(size: 96, weight: .thin)
    }
    
    var bodyFont: Font {
        return Font.system(size: 24, weight: .regular)
    }

    var buttonFont: Font {
        return Font.system(size: 16, weight: .medium)
    }

    var labelFont: Font {
        return Font.system(size: 14, weight: .regular)
    }
    
    var captionFont: Font {
        return Font.system(size: 12, weight: .regular)
    }
}

struct DefaultButtonTheme: ButtonTheme {
    var height: CGFloat {
        return 44
    }
    
    var cornerRadius: CGFloat {
        return 6
    }
    
    var padding: CGFloat {
        return 10
    }
    
    var borderWidth: CGFloat {
        return 1
    }
}

struct DefaultIconTheme: IconTheme {
    var chevronRight: Image {
        return Image(systemName: "chevron.right")
    }
    
    var aqi: Image {
        return Image(systemName: "aqi.medium")
    }
    
    var house: Image {
        return Image(systemName: "house")
    }
    
    var list: Image {
        return Image(systemName: "list.bullet")
    }
    
    var circle: Image {
        return Image(systemName: "circle.fill")
    }
    
    var sunrise: Image {
        return Image(systemName: "sunrise.fill")
    }
    
    var wind: Image {
        return Image(systemName: "wind")
    }
    
    var rain: Image {
        return Image(systemName: "cloud.rain.fill")
    }
    
    var snow: Image {
        return Image(systemName: "cloud.snow.fill")
    }
    
    var thermometer: Image {
        return Image(systemName: "thermometer.medium")
    }
    
    var humidity: Image {
        return Image(systemName: "humidity.fill")
    }
    
    var eye: Image {
        return Image(systemName: "eye.fill")
    }
    
    var gauge: Image {
        return Image(systemName: "gauge")
    }
    
    var paintpalette: Image {
        return Image(systemName: "paintpalette.fill")
    }
}
