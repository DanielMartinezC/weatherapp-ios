//
//  WeatherLocationsTestsNoCurrentLocation+Success.swift
//  WeatherUnitTests
//
//  Created by Daniel Martinez Condinanza on 19/11/24.
//

import XCTest
import Combine
@testable import Weather

@MainActor
final class WeatherLocationsTestsNoCurrentLocationSuccess: XCTestCase {
    
    private var viewModel: WeatherLocationsViewModel!
    
    private var cancellables = Set<AnyCancellable>()
    private var receivedStates = [WeatherLocationsViewModel.State]()
    
    private var expectedInitialLocationsList = 4
    private var expectedFinalLocationsWeather = 3

    public override func setUp() {
        super.setUp()
        viewModel = WeatherLocationsViewModel()
        InjectedValues[\.weatherRepository] = WeatherRepositoryMock()
        InjectedValues[\.locationRepository] = LocationRepositoryMockFailure()
    }
    
    public override func tearDown() {
        super.tearDown()
        viewModel = nil
        receivedStates = []
        cancellables = []
    }
    
    func testInitialState() {
        XCTAssertEqual(viewModel.availableLocations.count, expectedInitialLocationsList)
        XCTAssertEqual(viewModel.locationsWeather.isEmpty, true)
        XCTAssertEqual(viewModel.state, WeatherLocationsViewModel.State.idle)
        XCTAssertNil(viewModel.errorMessage, "Error message should be nil initially.")
        XCTAssertNil(viewModel.currentUserLocation, "Current user location should be nil initially.")
        XCTAssertNil(viewModel.locationError, "Location error should be nil initially.")
    }
    
    func testFetchCitiesOnlyLocationsWeatherSuccess() async throws {
        let expectation = expectation(
            description: "Expected to get locations weather information for all but current location"
        )
        
        let expectedStates: [WeatherLocationsViewModel.State] = [
            .idle,
            .loading,
            .loaded
        ]

        viewModel.$state
            .receive(on: RunLoop.main)
            .sink { state in
                self.receivedStates.append(state)
                if self.receivedStates.count == 3 {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        await viewModel.loadLocationsWeather()
        
        await fulfillment(of: [expectation])
        XCTAssertEqual(expectedStates, receivedStates)
        XCTAssertEqual(viewModel.locationsWeather.count, expectedFinalLocationsWeather)
        XCTAssertNil(viewModel.locationsWeather.first { $0.id == WeatherLocation.myLocation.id }, "My Location should not be loaded if not available")
    }
}
