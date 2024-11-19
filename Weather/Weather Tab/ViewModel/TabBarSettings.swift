//
//  TabBarSettings.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 19/11/24.
//

import Foundation

@MainActor
class TabBarSettings: ObservableObject {
    
    enum Tab: Int {
        case detail = 0
        case list = 1
        case undefined = -1
    }

    // MARK: - Properties
    @Published public var selectedTab: Int = Tab.detail.rawValue
    
    // MARK: - Init
    
    init() {}
    
}

// MARK: - Public
extension TabBarSettings {
    func isDetailTabSelected() -> Bool {
        selectedTab == Tab.detail.rawValue
    }
}
