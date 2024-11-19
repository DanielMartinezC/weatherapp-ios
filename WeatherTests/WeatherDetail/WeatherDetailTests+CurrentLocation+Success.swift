//
//  WeatherDetailTests+CurrentLocation+Success.swift
//  WeatherTests
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import XCTest
import Combine
@testable import Weather

@MainActor
final class WeatherViewModelCurrentLocationTests: XCTestCase {
    
    private var viewModel: WeatherDetailViewModel!
    
    private let expectedCurrentCoordinates = (latitude: -34.901, longitude: -56.1645)
    private var expectedCurrentLocationWeatherDetail = CurrentWeatherDetailModel(
        location: WeatherLocation.myLocation,
        item: CurrentWeatherResponse(
            name: "My Location",
            main: CurrentWeatherResponse.Main(
                temp: 5.6,
                feelsLike: 3.47,
                tempMin: 4.99,
                tempMax: 6.66,
                pressure: 1027,
                humidity: 90
            ),
            weather: [
                CurrentWeatherResponse.Weather(
                    description: "moderate rain",
                    iconName: .clouds
                )
            ],
            visibility: 10000,
            wind: CurrentWeatherResponse.Wind(speed: 2.57, deg: 40),
            clouds: CurrentWeatherResponse.Clouds(all: 92),
            sys: CurrentWeatherResponse.Sys(sunrise: 1731568648, sunset: 1731600763)
            )
        )

    public override func setUp() {
        super.setUp()
        viewModel = WeatherDetailViewModel(for: .myLocation)
        InjectedValues[\.weatherRepository] = WeatherRepositoryMock()
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
    
    func testFetchCurrentLocationWeatherData_Success() async throws {
        await viewModel.fetchWeather()
        XCTAssertNotNil(viewModel.currentUserLocation, "User Location should be set when searching for current location.")
        XCTAssertEqual(viewModel.currentUserLocation?.coordinate.latitude, expectedCurrentCoordinates.latitude)
        XCTAssertEqual(viewModel.currentUserLocation?.coordinate.longitude, expectedCurrentCoordinates.longitude)
        XCTAssertNil(viewModel.errorMessage, "Error message should be nil.")
        XCTAssertEqual(viewModel.currentWeather?.temperature, expectedCurrentLocationWeatherDetail.temperature)
        XCTAssertEqual(viewModel.currentWeather?.pressure, expectedCurrentLocationWeatherDetail.pressure)
        XCTAssertEqual(viewModel.currentWeather?.humidity, expectedCurrentLocationWeatherDetail.humidity)
        XCTAssertEqual(viewModel.currentWeather?.maxTemperature, expectedCurrentLocationWeatherDetail.maxTemperature)
    }
    
}
