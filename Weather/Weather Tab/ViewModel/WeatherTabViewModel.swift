//
//  WeatherTabViewModel.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation


class TabBarSettings: ObservableObject {
    
    public enum Tab: Int {
        case detail = 0
        case list = 1
        case undefined = -1
    }

    @Published public var selectedTab: Int = Tab.detail.rawValue
    
    public init() {}
    
    func isDetailTabSelected() -> Bool {
        selectedTab == Tab.detail.rawValue
    }
}


@MainActor
class WeatherTabViewModel: ObservableObject {
    
    public enum Tab: Int {
        case detail = 0
        case locations = 1
    }
    
    private(set) var availableLocations: [WeatherLocation]
    @Published var selectedLocation: WeatherLocation?
    
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
    
    func saveSelectedLocation(_ location: WeatherLocation) {
        UserDefaultsUtil.shared.save(location.id, forKey: AppStorageConstants.userLastSelectedLocation.rawValue)
    }
    
    func updateSelectedLocation(to newLocation: WeatherLocation) {
        selectedLocation = newLocation
        saveSelectedLocation(newLocation)
    }
}
