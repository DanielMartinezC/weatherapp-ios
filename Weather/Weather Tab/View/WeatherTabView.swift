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
                // Main Tab
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
                    Image(systemName: "house")
                }
                .tag(0)
                
                // List Tab
                WeatherLocationsBuilder.makeWeatherLocationsView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                    }
                    .tag(1)
            }.onAppear {
                setupTransparentBottomTabBar()
            }
            .accentColor(themeProvider.theme.colorTheme.primary)
            .overlay(
                tabBarSettings.isDetailTabSelected() ?
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.clear)
                        .frame(height: 60)
                        .overlay(
                            HStack {
                                Spacer()
                                ForEach(viewModel.availableLocations, id: \.id) { location in
                                    Image(systemName: "circle.fill")
                                        .font(Font.system(size: 8))
                                        .foregroundStyle(location == viewModel.selectedLocation ? .white : .gray)
                                }
                                Spacer()
                            }
                        )
                    : nil
                , alignment: .bottom
            )
            }
//        TabView(selection: $viewModel.selectedLocation) {
//            ForEach(viewModel.availableLocations, id: \.id) { location in
//                WeatherDetailBuilder
//                    .makeWeatherDetailView(for: location)
//                    .tag(location)
//            }
//        }
//        .tabViewStyle(.page)
//        .onChange(of: viewModel.selectedLocation) { newLocation in
//            if let newLocation = newLocation {
//                viewModel.saveSelectedLocation(newLocation)
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
    }
    
    private func setupTransparentBottomTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundEffect = UIBlurEffect(style: .systemMaterialLight) // Adds blur
        appearance.backgroundColor = UIColor( themeProvider.theme.colorTheme.tabBarBackground2.opacity(0.8))
        UITabBar.appearance().unselectedItemTintColor = UIColor(.gray)
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

#Preview {
    WeatherTabView(viewModel: WeatherTabViewModel(), tabBarSettings: TabBarSettings())
        .environmentObject(ThemeProvider.shared)
        .withColorScheme()
}
