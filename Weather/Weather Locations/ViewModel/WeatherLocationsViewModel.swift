//
//  WeatherLocationsViewModel.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation
import Combine
import CoreLocation

@MainActor
class WeatherLocationsViewModel: ObservableObject {
    
    @Injected(\.weatherRepository) var weatherRepository: WeatherRepository
    @Injected(\.locationRepository) var locationRepository: LocationRepository
    
    var availableLocations: [WeatherLocation] = WeatherLocation.availableLocations
    
    @Published var locationsWeather: [LocationWeatherItemModel] = []
    @Published private(set) var errorMessage: String?
    
    private(set) var currentUserLocation: CLLocation?
    private var locationError: LocationError? {
        didSet {
            if locationError != nil {
                errorMessage = locationError?.localizedDescription
            }
        }
    }
    
    init() {}
    
    func loadLocationsWeather() async {
        do {
            let locationsWeather = try await self.fetchData()
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
        } catch(let error) {
            errorMessage = error.localizedDescription
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
            errorMessage = "Failed to fetch weather for \(location.description): \(error)"
            throw error
        }
    }
}
