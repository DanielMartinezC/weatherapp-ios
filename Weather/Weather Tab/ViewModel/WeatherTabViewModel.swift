//
//  WeatherTabViewModel.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

@MainActor
class WeatherTabViewModel: ObservableObject {
    
    enum Tab: Int {
        case detail = 0
        case locations = 1
    }
    
    // MARK: - Properties
    private(set) var availableLocations: [WeatherLocation]
    @Published var selectedLocation: WeatherLocation?
    
    // MARK: - Init
    init() {
        let locations: [WeatherLocation] = WeatherLocation.availableLocations
        
        let userLastSelectedLocation = UserDefaultsUtil.shared.getString(
            forKey: AppStorageConstants.userLastSelectedLocation.rawValue
        )
        
        // Set user last selected location first in the array
        self.availableLocations = locations.partitioned(by: { $0.id == userLastSelectedLocation })
        
        // Set the selectedLocation based on the first item
        self.selectedLocation = availableLocations.first
    }
}

// MARK: - Public
extension WeatherTabViewModel {
    func saveSelectedLocation(_ location: WeatherLocation) {
        UserDefaultsUtil.shared.save(location.id, forKey: AppStorageConstants.userLastSelectedLocation.rawValue)
    }
    
    func updateSelectedLocation(to newLocation: WeatherLocation) {
        selectedLocation = newLocation
        saveSelectedLocation(newLocation)
    }
}
