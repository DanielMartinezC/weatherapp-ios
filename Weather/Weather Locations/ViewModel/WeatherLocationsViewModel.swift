//
//  WeatherLocationsViewModel.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation
import Combine
import CoreLocation
import os

@MainActor
class WeatherLocationsViewModel: ObservableObject {
    
    @Injected(\.weatherRepository) var weatherRepository: WeatherRepository
    @Injected(\.locationRepository) var locationRepository: LocationRepository
    
    @Published var state: State = .idle
    
    var availableLocations: [WeatherLocation] = WeatherLocation.availableLocations
    private(set) var locationsWeather: [LocationWeatherItemModel] = []
    private(set) var errorMessage: String?
    private(set) var currentUserLocation: CLLocation?
    private(set) var locationError: LocationError?
    
    init() {}
    
    func loadLocationsWeather() async {
        do {
            state = .loading
            errorMessage = nil
            let locationsWeather = try await self.fetchData()
            if locationsWeather.isEmpty {
                errorMessage = String.noWeatherDataHelpMessage
                state = .error(showMessage: true)
                return
            }
            self.locationsWeather = locationsWeather.sorted { (lhs, rhs) in
                // First, prioritize `.myLocation` over other locations
                if lhs.location == .myLocation && rhs.location != .myLocation {
                    return true
                }
                if lhs.location != .myLocation && rhs.location == .myLocation {
                    return false
                }
                
                // If both are `.myLocation` or both are other locations, sort by location id
                return lhs.id < rhs.id
            }
            state = .loaded
        } catch(let error) {
            Logger().error("\(error.localizedDescription)")
            state = .error(showMessage: false)
        }
    }
    
    func fetchData() async throws -> [LocationWeatherItemModel]  {
        try await withThrowingTaskGroup(of: (WeatherLocation, CurrentWeatherResponse).self) { group in
            for location in availableLocations {
                group.addTask {
                    if location == .myLocation {
                        await self.requestLocationWhenInUse()
                        await self.fetchCurrentLocation()
                    }
                    let weather = try await self.fetchWeather(for: location)
                    return (location, weather)
                }
            }
                    
            var locationsWeather = [LocationWeatherItemModel]()
                    
            for try await (location, weather) in group {
                locationsWeather.append(.init(location: location, item: weather))
            }
                    
            return locationsWeather
        }
    }
}

// MARK: Services
private extension WeatherLocationsViewModel {
    func requestLocationWhenInUse() async {
        do {
            try await locationRepository.requestWhenInUseAuthorization()
        } catch let error as LocationError {
            locationError = error
        } catch {
            locationError = .unableToDetermineLocation
        }
    }
    
    func fetchCurrentLocation() async {
        do {
            let location = try await locationRepository.requestLocation()
            currentUserLocation = location
        } catch let error as LocationError {
            locationError = error
        } catch {
            locationError = .unableToDetermineLocation
        }
    }
    
    func fetchWeather(for location: WeatherLocation) async throws -> CurrentWeatherResponse {
        do {
            switch location {
            case .myLocation:
                guard let currentUserLocation = currentUserLocation else {
                    locationError = .unableToDetermineLocation
                    throw LocationError.unableToDetermineLocation
                }
                let response = try await weatherRepository
                    .getCurrentWeather(for: currentUserLocation.coordinate.latitude, and: currentUserLocation.coordinate.longitude)
                return response
            case .city(let city):
                let response = try await weatherRepository.getCurrentWeather(for: city.name)
                return response
            }
        } catch(let error) {
            Logger().error("Failed to fetch weather for \(location.description): \(error)")
            throw error
        }
    }
}

extension WeatherLocationsViewModel {
    enum State {
        case idle
        case loading
        case loaded
        case error(showMessage: Bool)
    }
}
