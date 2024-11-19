//
//  String+Localization.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

extension String {
    static let notImplementedError = String(localized: "This feature is not yet implemented", bundle: .main)
    static let mockError = String(localized: "There was an error parsing the provided mock", bundle: .main)
    static let unknownError = String(localized: "There was an error", bundle: .main)
    static let outOfService = String(localized: "This functionality is out of service", bundle: .main)
    
    // MARK: - Status
    static let statusViewLoadingMessage = String(localized: "Please wait.\n We are loading the screen information", bundle: .main)
    static let statusViewErrorTitle = String(localized: "Whoops! Something went wrong", bundle: .main)
    static let statusViewErrorMessage = String(localized: "This functionality is currently out of service", bundle: .main)
}
