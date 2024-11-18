//
//  View+LabelStyles.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

public extension View {
    func titleStyle() -> some View {
        return modifier(TitleStyle())
    }
    
    func subtitleStyle(_ foregroundColor: Color? = nil) -> some View {
        return modifier(SubTitleStyle(foregroundColor))
    }
    
    func headingStyle(_ foregroundColor: Color? = nil) -> some View {
        return modifier(HeadingStyle(foregroundColor))
    }
    
    func bodyStyle(_ foregroundColor: Color? = nil) -> some View {
        return modifier(BodyStyle(foregroundColor))
    }
    
    func labelStyle(_ foregroundColor: Color? = nil) -> some View {
        return modifier(LabelStyle(foregroundColor))
    }
    
    func captionStyle(_ foregroundColor: Color? = nil) -> some View {
        return modifier(CaptionStyle(foregroundColor))
    }
    
}

