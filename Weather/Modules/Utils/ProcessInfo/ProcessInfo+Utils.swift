//
//  ProcessInfo+Utils.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

public extension ProcessInfo {
    var isPreview: Bool {
        return environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    var testing: Bool {
        return environment["TESTING"] == "1"
    }
}
