//
//  LocationRepository+Imp.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 14/11/24.
//

import Foundation
import CoreLocation

enum LocationError: Error {
    case unauthorized
    case unableToDetermineLocation
}

class LocationRepositoryImp: NSObject, LocationRepository {
    private let locationManager = CLLocationManager()
    private var authorizationRequests: [(Result<Void, LocationError>) -> Void] = []
    private var locationRequests: [(Result<CLLocation, LocationError>) -> Void] = []

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.distanceFilter = 1000
    }
    
    private func handleLocationRequestResult(_ result: Result<CLLocation, LocationError>) {
        while locationRequests.count > 0 {
            let request = locationRequests.removeFirst()
            request(result)
        }
    }
}

extension LocationRepositoryImp {
    func requestWhenInUseAuthorization() async throws {
        guard locationManager.authorizationStatus == .notDetermined else {
            return // Already authorized
        }

        try await withCheckedThrowingContinuation { continuation in
            self.authorizationRequests.append { result in
                switch result {
                case .success:
                    continuation.resume()
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
            
            // Request authorization
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func requestLocation() async throws -> CLLocation {
        guard locationManager.authorizationStatus == .authorizedAlways ||
              locationManager.authorizationStatus == .authorizedWhenInUse else {
            throw LocationError.unauthorized
        }

        return try await withCheckedThrowingContinuation { continuation in
            self.locationRequests.append { result in
                switch result {
                case .success(let location):
                    continuation.resume(returning: location)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }

            // Request location
            locationManager.requestLocation()
        }
    }
}

extension LocationRepositoryImp: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let locationError: LocationError
        if let error = error as? CLError, error.code == .denied {
            locationError = .unauthorized
        } else {
            locationError = .unableToDetermineLocation
        }
        handleLocationRequestResult(.failure(locationError))
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            handleLocationRequestResult(.success(location))
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        while authorizationRequests.count > 0 {
            let request = authorizationRequests.removeFirst()
            request(.success(()))
        }
    }
}

