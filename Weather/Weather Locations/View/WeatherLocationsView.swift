//
//  WeatherLocationsView.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import SwiftUI

struct WeatherLocationsView: View {
    @EnvironmentObject private var themeProvider: ThemeProvider
    @StateObject var viewModel: WeatherLocationsViewModel
    
    @State private var showTheme = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(
                    gradient: Gradient(colors: [themeProvider.theme.colorTheme.background1, themeProvider.theme.colorTheme.background2]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 10) {
                        ForEach(viewModel.locationsWeather, id: \.self) { location in
                            LocationWeatherItemView(location: location)
                        }
                    }.padding()
                }
            }
            .navigationTitle("Weather")
            .navigationBarTitleTextColor(themeProvider.theme.colorTheme.navigationText)
            .background(
                NavigationLink(destination: ThemesView(), isActive: $showTheme) {
                    EmptyView()
                }
                )
            .toolbar {
                Button {
                    showTheme = true
                } label: {
                    themeProvider.theme.iconTheme.paintpalette
                        .foregroundStyle(themeProvider.theme.colorTheme.navigationText)
                }
            }
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
