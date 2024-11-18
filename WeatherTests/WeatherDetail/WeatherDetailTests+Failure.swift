//
//  WeatherDetailTests+Failure.swift
//  WeatherTests
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//
import XCTest
import Combine
@testable import Weather

@MainActor
final class WeatherViewModelFailureTests: XCTestCase {
    
    private var viewModel: WeatherDetailViewModel!

    private var location = WeatherLocation.myLocation
    private var expectedWeatherDetail = CurrentWeatherDetailModel(
        locationName: WeatherLocation.myLocation.description,
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
        InjectedValues[\.weatherRepository] = WeatherRepositoryMockFailure()
        InjectedValues[\.locationRepository] = LocationRepositoryMockFailure()
    }
    
    public override func tearDown() {
        super.tearDown()
        viewModel = nil
    }

    func testInitialState() {
        XCTAssertNil(viewModel.currentWeather, "Weather data should be nil initially.")
        XCTAssertNil(viewModel.errorMessage, "Location error should be nil initially.")
        XCTAssertNil(viewModel.currentUserLocation, "Current user location should be nil initially.")
        XCTAssertNotEqual(viewModel.location, nil, "Location should be set initially.")
    }
    
    
    func testFetchLocation_Failure() async throws{
        await viewModel.fetchWeather()
        XCTAssertNil(viewModel.currentUserLocation, "User Location should be nil when a location errors ocurrs.")
        XCTAssertNil(viewModel.currentWeather, "Weather data should be nil on error.")
        XCTAssertNotNil(viewModel.errorMessage, "Error message shouldn't be nil.")
    }
    
    func testFetchWeatherData_Failure() async throws{
        InjectedValues[\.locationRepository] = LocationRepositoryMock()
        await viewModel.fetchWeather()
        XCTAssertNotNil(viewModel.currentUserLocation, "User location shouldn't be nil if the error happens on the fetch weather action only.")
        XCTAssertNotNil(viewModel.errorMessage, "Fetch location error message should be set.")
        XCTAssertNil(viewModel.currentWeather, "Weather data should be nil on error.")
       
    }
}
