//
//  WeatherDetailTests+City+Success.swift
//  WeatherTests
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import XCTest
import Combine
@testable import Weather

@MainActor
final class WeatherViewModelCityTests: XCTestCase {
    
    private var viewModel: WeatherDetailViewModel!
    
    private var londonCity = City(id: "london", name: "London", latitude: 51.5074, longitude: -0.1278)
    private var expectedLondonLocationWeatherDetail = CurrentWeatherDetailModel(
        locationName: WeatherLocation.myLocation.description,
        item: CurrentWeatherResponse(
            name: "London",
            main: CurrentWeatherResponse.Main(
                temp: 10.48,
                feelsLike: 8.74,
                tempMin: 6.56,
                tempMax: 12.05,
                pressure: 1015,
                humidity: 80
            ),
            weather: [
                CurrentWeatherResponse.Weather(
                    description: "moderate rain",
                    iconName: .rain
                )
            ],
            visibility: 10000,
            wind: CurrentWeatherResponse.Wind(speed: 2.57, deg: 30),
            clouds: CurrentWeatherResponse.Clouds(all: 100),
            sys: CurrentWeatherResponse.Sys(sunrise: 1731568648, sunset: 1731600763),
            rain: CurrentWeatherResponse.Rain(oneHour: 2.47),
            snow: CurrentWeatherResponse.Snow(oneHour: 1.10)
            )
        )

    public override func setUp() {
        super.setUp()
        viewModel = WeatherDetailViewModel(for: .city(city: londonCity))
        InjectedValues[\.weatherRepository] = WeatherRepositoryMockSecondScenario()
        InjectedValues[\.locationRepository] = LocationRepositoryMock()
    }
    
    public override func tearDown() {
        super.tearDown()
        viewModel = nil
    }

    func testInitialState() {
        XCTAssertNil(viewModel.currentWeather, "Weather data should be nil initially.")
        XCTAssertNil(viewModel.errorMessage, "Error message should be nil initially.")
        XCTAssertNil(viewModel.currentUserLocation, "Current user location should be nil initially.")
        XCTAssertNotNil(viewModel.location, "Location should be initially set.")
    }
    
    func testFetchLondonLocationWeatherData_Success() async throws {
        await viewModel.fetchWeather()
        XCTAssertNil(viewModel.currentUserLocation, "User Location shouldnt be asked when searching for London (or any other city).")
        XCTAssertNil(viewModel.errorMessage, "Error message should be nil.")
        XCTAssertEqual(viewModel.currentWeather?.temperature, expectedLondonLocationWeatherDetail.temperature)
        XCTAssertEqual(viewModel.currentWeather?.pressure, expectedLondonLocationWeatherDetail.pressure)
        XCTAssertEqual(viewModel.currentWeather?.humidity, expectedLondonLocationWeatherDetail.humidity)
        XCTAssertEqual(viewModel.currentWeather?.maxTemperature, expectedLondonLocationWeatherDetail.maxTemperature)
    }
}
