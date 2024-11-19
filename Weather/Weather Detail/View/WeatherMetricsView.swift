//
//  AirPollutionView.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 13/11/24.
//

import SwiftUI

struct WeatherMetricsView: View {
    @EnvironmentObject private var themeProvider: ThemeProvider
    
    let currentWeather: CurrentWeatherDetailModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            SunEventsView
            WindView
            FeelsLikeView
            HumidityView
            VisibilityView
            PressureView
            RainfallView
            SnowView
        }
        .frame(maxWidth: .infinity)
        .shadow(color: themeProvider.theme.colorTheme.shadow, radius: 30, x:0, y: 10)
    }
}

extension WeatherMetricsView {
    var SunEventsView: some View {
        MetricView(
            title: "SUNRISE",
            icon: themeProvider.theme.iconTheme.sunrise,
            mainText: currentWeather.sunrise,
            subtitle: "Sunset: \(currentWeather.sunset)"
        )
    }
}

extension WeatherMetricsView {
    var WindView: some View {
        MetricView(
            title: "WIND",
            icon: themeProvider.theme.iconTheme.wind,
            mainText: currentWeather.windSpeed
        )
    }
}

extension WeatherMetricsView {
    var SnowView: some View {
        MetricView(
            title: "SNOW",
            icon: themeProvider.theme.iconTheme.snow,
            mainText: currentWeather.snow,
            subtitle: "in the last hour."
        )
    }
}

extension WeatherMetricsView {
    var RainfallView: some View {
        MetricView(
            title: "RAINFALL",
            icon: themeProvider.theme.iconTheme.rain,
            mainText: currentWeather.rain,
            subtitle: "in the last hour."
        )
    }
}

extension WeatherMetricsView {
    var FeelsLikeView: some View {
        MetricView(
            title: "FEELS LIKE",
            icon: themeProvider.theme.iconTheme.thermometer,
            mainText: currentWeather.temperatureFeelsLike,
            subtitle: currentWeather.temperatureFeelsLikeDescription
        )
    }
}

extension WeatherMetricsView {
    var HumidityView: some View {
        MetricView(
            title: "HUMIDITY",
            icon: themeProvider.theme.iconTheme.humidity,
            mainText: currentWeather.humidity,
            subtitle: currentWeather.dewPointDescription
        )
    }
}

extension WeatherMetricsView {
    var VisibilityView: some View {
        MetricView(
            title: "VISIBILITY",
            icon: themeProvider.theme.iconTheme.eye,
            mainText: currentWeather.visibility,
            subtitle: currentWeather.visibilityDescription
        )
    }
}

extension WeatherMetricsView {
    var PressureView: some View {
        MetricView(
            title: "PRESSURE",
            icon: themeProvider.theme.iconTheme.gauge,
            mainText: currentWeather.pressure
        )
    }
}


#if DEBUG
struct WeatherMetricsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMetricsView(currentWeather: dev.weatherWithRainAndSnow)
            .environmentObject(ThemeProvider.shared)
            .previewLayout(.sizeThatFits)
    }
}
#endif
