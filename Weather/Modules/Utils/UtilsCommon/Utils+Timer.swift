//
//  Utils+Timer.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation

import Foundation

class Utils {
    public static func setupTimerIfNeeded() async {
        if !ProcessInfo.processInfo.testing {
            try? await Task.sleep(nanoseconds: 1 * 1_000_000_000) // 2 seconds in nanoseconds
        }
    }
}
