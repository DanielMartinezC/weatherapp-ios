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
    
    private(set) var currentUserLocation: CLLocation?
    @Published private(set) var locationError: LocationError?
    
    // MARK: Init
    init(for location: WeatherLocation) {
        self.location = location
    }
}

// MARK: Public Methods
extension WeatherDetailViewModel {
    func fetchWeather() async {
        if location == .myLocation {
            await requestLocationWhenInUse()
            await fetchCurrentLocation()
        }
        await fetchWeatherDetail(for: location)
    }
    
    func isLocationNotAuthorized() -> Bool {
        locationError == .unauthorized
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
    
    func fetchWeatherDetail(for location: WeatherLocation) async {
        do {
            switch location {
            case .myLocation:
                guard let currentUserLocation = currentUserLocation else {
                    return
                }
                async let weatherInformationResponse = weatherRepository
                    .getCurrentWeather(for: currentUserLocation.coordinate.latitude, and: currentUserLocation.coordinate.longitude)
                async let airPollutionResponse = weatherRepository
                    .getAirPollution(for: currentUserLocation.coordinate.latitude, and: currentUserLocation.coordinate.longitude)
                self.currentWeather = try await CurrentWeatherDetailModel(location: location, item: weatherInformationResponse, pollution: airPollutionResponse)
            case .city(let city):
                async let weatherInformationResponse = weatherRepository.getCurrentWeather(for: city.name)
                async let airPollutionResponse = weatherRepository
                    .getAirPollution(for: city.latitude, and: city.longitude)
                self.currentWeather = try await CurrentWeatherDetailModel(location: location, item: weatherInformationResponse, pollution: airPollutionResponse)
            }
        } catch {
            errorMessage = "Failed to fetch weather detail: \(error)"
        }
    }
}
