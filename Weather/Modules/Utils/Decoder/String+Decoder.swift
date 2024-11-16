//
//  String+Decoder.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation
import os

public extension String {
    func decode<T: Decodable>(toObject object: T.Type) throws -> T? {
        
        let jsonData = self.data(using: .utf8)
        
        let decoder = JSONDecoder()
        
        // In case date format from backend change we can also set custom format like this:
        /*
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        formatter.locale = Locale(identifier: "es_UY")
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.calendar = Calendar.current
        decoder.dateDecodingStrategy = .formatted(formatter)
        */
        
        // If UTC:
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            return try decoder.decode(object.self, from: jsonData!)
        } catch let error {
            Logger().error("Decode error: \(error)")
        }
        
        return nil
    }
}
