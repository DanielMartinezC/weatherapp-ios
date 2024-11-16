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
        return Color("background1").opacity(0.8)
    }

    var bottomSheetBackground1: Color {
        return Color("Background 1").opacity(0.26)
    }
    
    var weatherWidgetBackground: Color {
        return Color("weatherWidgetBackground2")
    }
    
    var background2: Color {
        return Color("background2")
    }

    var bottomSheetBackground2: Color {
        return Color("background2").opacity(0.26)
    }

    var tabBarBackground1: Color {
        return Color("tabBarBackground1")
    }
    
    var tabBarBackground2: Color {
        return Color("tabBarBackground2")
    }

    var shadow: Color {
        return .black
    }

    var secondary: Color {
        return .white
    }

    var primary: Color {
        return .white
    }

    var title: Color {
        return .white
    }

    var subtitle: Color {
        return .white
    }

    var body: Color {
        return .white
    }

    var label: Color {
        return .white
    }
    
    var regularText: Color {
        return .white
    }
}

struct DefaultColorTheme: ColorTheme {
    
    var background1: Color {
        return Color("background1").opacity(0.8)
    }

    var bottomSheetBackground1: Color {
        return Color("background1").opacity(0.26)
    }

    var weatherWidgetBackground: Color {
        return Color("weatherWidgetBackground1")
    }

    var background2: Color {
        return Color("background2")
    }

    var bottomSheetBackground2: Color {
        return Color("background2").opacity(0.26)
    }
    
    var tabBarBackground1: Color {
        return Color("tabBarBackground1")
    }
    
    var tabBarBackground2: Color {
        return Color("tabBarBackground2")
    }

    var shadow: Color {
        return .black
    }

    var secondary: Color {
        return .purple
    }

    var primary: Color {
        return .white
    }

    var title: Color {
        return .white
    }

    var subtitle: Color {
        return .white
    }

    var body: Color {
        return .white
    }

    var label: Color {
        return .white
    }
    
    var regularText: Color {
        return .white
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
        return Font.system(size: 16, weight: .regular)
    }

    var buttonFont: Font {
        return Font.system(size: 16, weight: .medium)
    }

    var labelFont: Font {
        return Font.system(size: 16, weight: .regular)
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
        return Image(systemName: "cloud.thermometer")
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
}
