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
            // MARK: Trapezoid
            Trapezoid()
                .fill(themeProvider.theme.colorTheme.weatherWidgetBackground)
                .frame(width: 342, height: 174)
            
            // MARK: Content
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 8) {
                    // MARK: Forecast Temperature
                    Text("\(location.temperature)")
                        .font(.system(size: 64))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        // MARK: Forecast Temperature Range
                        Text("H:\(location.maxTemperature) L:\(location.minTemperature)")
                            .font(.footnote)
                        
                        // MARK: Forecast Location
                        Text(location.location.description)
                            .font(.body)
                            .lineLimit(1)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 0) {
                    Image(systemName: location.icon ?? .empty)
                        .padding(.trailing, 10)
                    
                    // MARK: Weather
                    Text(location.description)
                        .font(.footnote)
                        .padding(.trailing, 10)
                    
                }
                
            }
            .foregroundColor(.white)
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

