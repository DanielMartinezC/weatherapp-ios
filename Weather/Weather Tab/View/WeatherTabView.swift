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
            .onAppear {
                setupTransparentBottomTabBar()
            }
//            .onReceive(themeProvider.objectWillChange) { _ in
//                setupTransparentBottomTabBar()
//            }
            .accentColor(themeProvider.theme.colorTheme.navigationText)
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
    
    private func setupTransparentBottomTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundEffect = UIBlurEffect(style: .systemMaterialLight)
        UITabBar.appearance().unselectedItemTintColor = UIColor(themeProvider.theme.colorTheme.navigationText.opacity(0.2))
        
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().standardAppearance = appearance
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
                    .foregroundStyle( currentPage ? themeProvider.theme.colorTheme.navigationText : themeProvider.theme.colorTheme.navigationText.opacity(0.2))
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
