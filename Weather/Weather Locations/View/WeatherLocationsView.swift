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
    @State var isLoading = false
    @State var displayError = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(
                    gradient: Gradient(colors: [themeProvider.theme.colorTheme.background1, themeProvider.theme.colorTheme.background2]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                if isLoading {
                    StatusView(status: .loading)
                } else {
                    if displayError {
                        VStack(alignment: .leading, spacing: 20) {
                            StatusView(
                                status: .error,
                                message: viewModel.errorMessage,
                                fullScreen: true,
                                primaryActionTitle: String.retry,
                                primaryAction: reloadScreenData
                            ).padding()
                        }.padding()
                    } else {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVStack(spacing: 10) {
                                ForEach(viewModel.locationsWeather, id: \.self) { location in
                                    LocationWeatherItemView(location: location)
                                }
                            }.padding()
                        }
                    }
                }
            }
            .navigationTitle(String.weatherLocationTitle)
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
        .onReceive(viewModel.$state, perform: evaluateState)
        
    }
    
    private func reloadScreenData() {
        Task {
            await viewModel.loadLocationsWeather()
        }
    }
    
    private func evaluateState(_ state: WeatherLocationsViewModel.State) {
        switch state {
        case .loading:
            isLoading = true
        case .error(let showMessage):
            displayError = showMessage
            isLoading = false
        case .loaded:
            displayError = false
            isLoading = false
        case .idle:
            break
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
