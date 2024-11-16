//
//  WeatherLocationsView.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import SwiftUI

extension View {
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}

struct WeatherLocationsView: View {
    @EnvironmentObject private var themeProvider: ThemeProvider
    @StateObject var viewModel: WeatherLocationsViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                
                themeProvider.theme.colorTheme.background1
                    .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 10) {
                        ForEach(viewModel.locationsWeather, id: \.self) { location in
                            LocationWeatherItemView(location: location)
                        }
                    }.padding()
                }
            }
            .navigationTitle("Weather")
            .navigationBarTitleTextColor(themeProvider.theme.colorTheme.title)
        }
        .task {
            await viewModel.loadLocationsWeather()
        }
        
    }
}

#if DEBUG
struct WeatherLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherLocationsView(viewModel: WeatherLocationsViewModel())
            .environmentObject(ThemeProvider.shared)
            .withColorScheme()
    }
}
#endif
