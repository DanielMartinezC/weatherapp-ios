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
    var buttonTheme: ButtonTheme { get }
    var iconTheme: IconTheme { get }
}

public protocol Schemes {
    var lightScheme: ColorTheme { get }
    var darkScheme: ColorTheme { get }
}

public protocol ColorTheme {
    var background1: Color { get }
    var background2: Color { get }
    var bottomSheetBackground: Color { get }
    var weatherWidgetBackground: Color { get }
    var tabBarIcon: Color { get }
    var primary: Color { get }
    var secondary: Color { get }
    var title: Color { get }
    var body: Color { get }
    var label: Color { get }
    var shadow: Color { get }
    var border: Color { get }
    var navigationText: Color { get }
}

public protocol FontTheme {
    var titleFont: Font { get }
    var subtitleFont: Font { get }
    var headlineFont: Font { get }
    var bodyFont: Font { get }
    var labelFont: Font { get }
    var captionFont: Font { get }
    var buttonFont: Font { get }
}

public protocol ButtonTheme {
    var height: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var padding: CGFloat { get }
    var borderWidth: CGFloat { get }
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
    var paintpalette: Image { get }
}
