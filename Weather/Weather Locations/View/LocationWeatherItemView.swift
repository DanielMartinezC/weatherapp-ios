//
//  LocationWeatherItemView.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

struct LocationWeatherItemView: View {
    @EnvironmentObject private var themeProvider: ThemeProvider
    var location: LocationWeatherItemModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Trapezoid()
                .fill(themeProvider.theme.colorTheme.weatherWidgetBackground)
                .frame(width: 342, height: 174)
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(location.temperature)")
                        .titleStyle()
                    
                    VStack(alignment: .leading, spacing: 2) {
                        // MARK: Forecast Temperature Range
                        Text("H:\(location.maxTemperature) L:\(location.minTemperature)")
                            .captionStyle()
                        
                        Text(location.location.description)
                            .bodyStyle()
                            .lineLimit(1)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 0) {
                    Image(systemName: location.icon ?? .empty)
                        .padding(.trailing, 10)
                    
                    Text(location.description)
                        .labelStyle()
                        .padding(.trailing, 10)
                    
                }
                
            }
            .foregroundColor(themeProvider.theme.colorTheme.label)
            .padding(.bottom, 20)
            .padding(.leading, 20)
        }
        .frame(width: 342, height: 184, alignment: .bottom)
    }
}

#if DEBUG
struct LocationWeatherItemView_Previews: PreviewProvider {
    static var previews: some View {
        LocationWeatherItemView(location: dev.locationWeatherItem)
            .environmentObject(ThemeProvider.shared)
            .withColorScheme()
    }
}
#endif

