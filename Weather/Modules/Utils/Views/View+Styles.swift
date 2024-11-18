//
//  View+Styles.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import SwiftUI

extension View {
    func backgroundBlur(radius: CGFloat = 3, opaque: Bool = false) -> some View {
        self
            .background(Blur(radius: radius, opaque: opaque))
    }
}

