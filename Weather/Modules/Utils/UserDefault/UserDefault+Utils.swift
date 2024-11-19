//
//  UserDefault+Utils.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import Foundation

class UserDefaultsUtil {
    public static let shared = UserDefaultsUtil()
    
    private init() {}
        
    // MARK: - Items saving
}

// MARK: - Saving

extension UserDefaultsUtil {
    func save(_ value: Any, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
}

// MARK: - Getting

extension UserDefaultsUtil {
    func getBool(forKey key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    func getString(forKey key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
}

// MARK: - Deleting

extension UserDefaultsUtil {
    func removeValue(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}

