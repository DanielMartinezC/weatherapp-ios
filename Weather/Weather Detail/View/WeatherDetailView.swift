//
//  WeatherDetailView.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import SwiftUI

struct WeatherDetailView: View {
    
    @StateObject var viewModel: WeatherDetailViewModel
    @EnvironmentObject private var themeProvider: ThemeProvider
    
    @State private var currentWeatherInfoExpanded = true
    @State private var scrollPosition: CGPoint = .zero
    
    var scrollTopYPosition: Double = -60.0
        
    var body: some View {
        let _ = Self._printChanges()
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [themeProvider.theme.colorTheme.background1, themeProvider.theme.colorTheme.background2]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack(spacing: 5) {
                VStack {
                    if let currentWeather = viewModel.currentWeather {
                        Text(currentWeather.locationName)
                            .titleStyle()
                            .padding(.top, 60)
                        
                        ZStack {
                            if currentWeatherInfoExpanded {
                                VStack {
                                    Text(currentWeather.temperature)
                                        .headingStyle()
                                    
                                    Text("H:\(currentWeather.maxTemperature) L:\(currentWeather.minTemperature)")
                                        .subtitleStyle()
                                        .opacity(1-(scrollPosition.y / scrollTopYPosition))
                                }
                            } else {
                                Text("\(currentWeather.temperature) | \(currentWeather.description)")
                                    .subtitleStyle()
                            }
                            
                        }
                        .frame(maxHeight: currentWeatherInfoExpanded ? 140 : 40)
                    } else {
                        Text("-")
                            .titleStyle()
                            .padding(.top, 60)
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    WeatherDashboardView
                        .backgroundBlur(radius: 25, opaque: true)
                }
                .coordinateSpace(name: "scroll")
            }
        }
        .animation(.easeInOut, value: currentWeatherInfoExpanded)
        .task {
            await viewModel.fetchWeather()
            await viewModel.fetchAirPollution()
        }
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}

// MARK: Weather Dashboard Section
extension WeatherDetailView {
    var WeatherDashboardView: some View {
        LazyVStack(spacing: 20) {
            
            if let currentWeather = viewModel.currentWeather {

                if let currentAirPollution = viewModel.currentAirPollution {
                    AirPollutionView(
                        value: currentAirPollution.aqi,
                        risk: currentAirPollution.risk,
                        aqiNumber: currentAirPollution.aqiNumber
                    )
                    .shadow(color: .black.opacity(0.3), radius: 30, x:0, y: 10)
                }

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    SunEventsView(sunrise: currentWeather.sunrise, sunset: currentWeather.sunset)
                    WindView(value: currentWeather.windSpeed)
                    if let rain = currentWeather.rain {
                        RainfallView(value: rain)
                    }
                    if let snow = currentWeather.snow {
                        SnowView(value: snow)
                    }
                    FeelsLikeView(value: currentWeather.temperatureFeelsLike)
                    HumidityView(value: currentWeather.humidity)
                    VisibilityView(value: currentWeather.visibility)
                    PressureView(value: currentWeather.pressure)
                }
                .frame(maxWidth: .infinity)
                .shadow(color: .black.opacity(0.3), radius: 30, x:0, y: 10)
            }
        }
        .padding()
        .background(GeometryReader { geometry in
                Color.clear
                .preference(
                    key: ScrollOffsetPreferenceKey.self,
                    value: geometry.frame(in: .named("scroll")).origin)
        })
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
            self.scrollPosition = value
            evaluateScrollPosition()
        }
    }
    
    func evaluateScrollPosition() {
        if scrollPosition.y < scrollTopYPosition {
            if currentWeatherInfoExpanded {
                withAnimation {
                    currentWeatherInfoExpanded = false
                }
            }
            
        } else if scrollPosition.y >= 0 {
            if !currentWeatherInfoExpanded {
                withAnimation {
                    currentWeatherInfoExpanded = true
                }
            }
        }
    }
}
#if DEBUG
struct LocationWeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(viewModel: WeatherDetailViewModel(for: .myLocation))
            .environmentObject(ThemeProvider.shared)
            .withColorScheme()
    }
}

struct LocationWeatherDetailViewError_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = WeatherDetailViewModel(for: .myLocation)
        InjectedValues[\.weatherRepository] = WeatherRepositoryMockSecondScenario()
        return WeatherDetailView(viewModel: viewModel)
            .environmentObject(ThemeProvider.shared)
            .withColorScheme()
    }
}
#endif
