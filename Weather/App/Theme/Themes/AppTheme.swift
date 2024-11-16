//
//  AppTheme.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

struct AppTheme: Theme {
    var colorTheme: ColorTheme = DefaultColorTheme()
    
    var schemes: Schemes {
        return AppSchemes()
    }
    
    var fontTheme: FontTheme {
        return DefaultFontTheme()
    }
    
    var iconTheme: IconTheme {
        return DefaultIconTheme()
    }
}

struct AppSchemes: Schemes {
    
    var lightScheme: ColorTheme {
        return DefaultColorTheme()
    }
    
    var darkScheme: ColorTheme {
        return DefaultDarkColorTheme()
    }
}
