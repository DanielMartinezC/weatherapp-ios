//
//  WeatherDetailViewModel.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation
import Combine
import CoreLocation

@MainActor
class WeatherDetailViewModel: ObservableObject {
    
    // MARK: Properties
    @Injected(\.weatherRepository) var weatherRepository: WeatherRepository
    @Injected(\.locationRepository) var locationRepository: LocationRepository
    
    private(set) var location: WeatherLocation
    
    @Published private(set) var errorMessage: String?
    @Published private(set) var currentWeather: CurrentWeatherDetailModel?
    @Published private(set) var currentAirPollution: CurrentAirPollutionDetailModel?
    
    private(set) var currentUserLocation: CLLocation?
    private var locationError: LocationError? {
        didSet {
            if locationError != nil {
                errorMessage = locationError?.localizedDescription
            }
        }
    }
    
    // MARK: Init
    init(for location: WeatherLocation) {
        self.location = location
    }
}

// MARK: Public Methods
extension WeatherDetailViewModel {
    func fetchWeather() async {
        if location == .myLocation {
            locationError = nil
            await requestLocationWhenInUse()
            await fetchCurrentLocation()
        }
        await fetchWeather(for: location)
    }
    
    func fetchAirPollution() async {
        if currentUserLocation == nil {
            await fetchCurrentLocation()
        }
        await fetchAirPollution(for: location)
    }
}

// MARK: Services
private extension WeatherDetailViewModel {
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
    
    func fetchWeather(for location: WeatherLocation) async {
        do {
            switch location {
            case .myLocation:
                guard let currentUserLocation = currentUserLocation else {
                    locationError = .unableToDetermineLocation
                    return
                }
                let response = try await weatherRepository
                    .getCurrentWeather(for: currentUserLocation.coordinate.latitude, and: currentUserLocation.coordinate.longitude)
                self.currentWeather = CurrentWeatherDetailModel(locationName: location.description, item: response)
            case .city(let city):
                let response = try await weatherRepository.getCurrentWeather(for: city.name)
                self.currentWeather = CurrentWeatherDetailModel(locationName: location.description, item: response)
            }
        } catch {
            errorMessage = "Failed to fetch weather: \(error)"
        }
    }
    
    func fetchAirPollution(for location: WeatherLocation) async {
        do {
            switch location {
            case .myLocation:
                guard let currentUserLocation = currentUserLocation else {
                    locationError = .unableToDetermineLocation
                    return
                }
                let response = try await weatherRepository
                    .getAirPollution(for: currentUserLocation.coordinate.latitude, and: currentUserLocation.coordinate.longitude)
                self.currentAirPollution = CurrentAirPollutionDetailModel(locationName: location.description, item: response)
            case .city(let city):
                let response = try await weatherRepository
                    .getAirPollution(for: city.latitude, and: city.longitude)
                self.currentAirPollution = CurrentAirPollutionDetailModel(locationName: location.description, item: response)
            }
        } catch {
            errorMessage = "Failed to fetch weather: \(error)"
        }
    }
}
