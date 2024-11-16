//
//  DefaultIconsShowRoomView.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

internal struct IconItem {
    let name: String
    let image: Image
}

struct DefaultIconsShowRoomView: View {
    let iconTheme = ThemeProvider.shared.theme.iconTheme
    var icons = [IconItem]()
    
    init() {
        icons.append(
            contentsOf: [
                IconItem(name: "chevronRight", image: iconTheme.chevronRight),
                IconItem(name: "aqi", image: iconTheme.aqi),
                IconItem(name: "circle", image: iconTheme.circle),
                IconItem(name: "eye", image: iconTheme.eye),
                IconItem(name: "gauge", image: iconTheme.gauge),
                IconItem(name: "house", image: iconTheme.house),
                IconItem(name: "humidity", image: iconTheme.humidity),
                IconItem(name: "list", image: iconTheme.list),
                IconItem(name: "rain", image: iconTheme.rain),
                IconItem(name: "snow", image: iconTheme.snow),
                IconItem(name: "sunrise", image: iconTheme.sunrise),
                IconItem(name: "thermometer", image: iconTheme.thermometer),
                IconItem(name: "wind", image: iconTheme.wind),
            ]
        )
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(icons, id: \.name) { iconItem in
                    HStack {
                        Text(iconItem.name)
                        Spacer()
                        iconItem.image
                    }
                }
            }
        }
        .navigationTitle("Icons")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DefaultIconsShowRoomView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultIconsShowRoomView()
    }
}

