//
//  Theme.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

public protocol Theme {
    var schemes: Schemes { get }
    var colorTheme: ColorTheme { get set }
    var fontTheme: FontTheme { get }
    var iconTheme: IconTheme { get }
}

public protocol Schemes {
    var lightScheme: ColorTheme { get }
    var darkScheme: ColorTheme { get }
}

public protocol ColorTheme {
    
    var background1: Color { get }
    var bottomSheetBackground1: Color { get }
    var weatherWidgetBackground: Color { get }
    var background2: Color { get }
    var bottomSheetBackground2: Color { get }
    var tabBarBackground1: Color { get }
    var tabBarBackground2: Color { get }
    
    var primary: Color { get }
    var secondary: Color { get }
    var title: Color { get }
    var subtitle: Color { get }
    var body: Color { get }
    var label: Color { get }
    var regularText: Color { get }
    var shadow: Color { get }
    
}

public protocol FontTheme {
    var titleFont: Font { get }
    var subtitleFont: Font { get }
    var headlineFont: Font { get }
    var bodyFont: Font { get }
    var labelFont: Font { get }
}

public protocol IconTheme {
    var chevronRight: Image { get }
    var aqi: Image { get }
    var house: Image { get }
    var list: Image { get }
    var circle: Image { get }
    var sunrise: Image { get }
    var wind: Image { get }
    var rain: Image { get }
    var snow: Image { get }
    var thermometer: Image { get }
    var humidity: Image { get }
    var eye: Image { get }
    var gauge: Image { get }
}
