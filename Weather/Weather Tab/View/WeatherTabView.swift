//
//  WeatherTabView.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import SwiftUI

struct WeatherTabView: View {
    
    @StateObject var viewModel: WeatherTabViewModel
    @StateObject var tabBarSettings: TabBarSettings
    @EnvironmentObject private var themeProvider: ThemeProvider
    
    var body: some View {
        ZStack {
            TabView(selection: $tabBarSettings.selectedTab) {
                
                TabView(selection: $viewModel.selectedLocation) {
                    ForEach(viewModel.availableLocations, id: \.id) { location in
                        WeatherDetailBuilder
                            .makeWeatherDetailView(for: location)
                            .tag(location)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .onChange(of: viewModel.selectedLocation) { newLocation in
                    if let newLocation = newLocation {
                        viewModel.saveSelectedLocation(newLocation)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    themeProvider.theme.iconTheme.house
                }
                .tag(0)
                
                WeatherLocationsBuilder.makeWeatherLocationsView()
                .tabItem {
                    themeProvider.theme.iconTheme.list
                }
                .tag(1)
                
            }
            .accentColor(themeProvider.theme.colorTheme.tabBarIcon)
            .navigationTabBarStyle(unselectedItemColor: themeProvider.theme.colorTheme.tabBarIcon.opacity(0.4))
            .overlay(
                tabBarSettings.isDetailTabSelected() ?
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(height: 60)
                        .overlay(
                            CustomPagerView
                        )
                    : nil
                , alignment: .bottom
            )
        }
    }
}

extension WeatherTabView {
    var CustomPagerView: some View {
        HStack {
            Spacer()
            ForEach(viewModel.availableLocations, id: \.id) { location in
                let currentPage = location == viewModel.selectedLocation
                themeProvider.theme.iconTheme.circle
                    .font(Font.system(size: 8))
                    .foregroundStyle( currentPage ? themeProvider.theme.colorTheme.tabBarIcon : themeProvider.theme.colorTheme.tabBarIcon.opacity(0.4))
                    .animation(.easeInOut, value: viewModel.selectedLocation)
            }
            Spacer()
        }
    }
}

#Preview {
    WeatherTabView(viewModel: WeatherTabViewModel(), tabBarSettings: TabBarSettings())
        .environmentObject(ThemeProvider.shared)
        .withColorScheme()
}
