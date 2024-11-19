//
//  Config.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//


import Foundation

class Config: NSObject {
    
    enum Environment: String {
        case production = "Production"
        case development = "Development"
    }
    
    static let sharedInstance = Config()
    
    var config: NSDictionary?
    
    private override init() {
        
        var currentConfiguration = (
            Bundle.main.object(forInfoDictionaryKey: "Config") as? String ?? String.empty
        ).replacingOccurrences(of: "Release", with: String.empty)
        currentConfiguration = currentConfiguration.replacingOccurrences(of: "Debug", with: String.empty)
        
        let path = Bundle.main.path(forResource: "Config", ofType: "plist")!
        self.config = NSDictionary(
            contentsOfFile: path
        )?.object(forKey: currentConfiguration) as? NSDictionary
    }
    
    func servicesURL() -> String {
        let key = environmentIsMocking() ? "MockServicesURL" : "ServicesURL"
        return self.config?.object(forKey: key) as? String ?? String.empty
    }
    
    func openWeatherAPIKey() -> String {
        return self.config?.object(forKey: "OpenWeatherAPIKey") as? String ?? String.empty
    }
    
    func environmentIsMocking() -> Bool {
        return self.config?.object(forKey: "Mocking") as? Bool ?? false
    }
    
    func environment() -> Environment {
        if let infoDictionary = Bundle.main.infoDictionary,
            let envStr = infoDictionary["Environment"] as? String {
            return Environment(rawValue: envStr) ?? .development
        } else {
            return .production
        }
    }
}

