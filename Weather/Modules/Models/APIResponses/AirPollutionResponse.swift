//
//  AirPollutionResponse.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//


import Foundation

struct AirPollutionResponse: Codable {
    let list: [PollutionData]
    
    struct PollutionData: Codable {
        let dt: Int
        let main: Main
        let components: Components
        
        struct Main: Codable {
            let aqi: Int
        }
        
        struct Components: Codable {
            let co: Double
            let no: Double
            let no2: Double
            let o3: Double
            let so2: Double
            let pm2Point5: Double
            let pm10: Double
            let nh3: Double
            
            enum CodingKeys: String, CodingKey {
                case co, no, no2, o3, so2, pm2Point5 = "pm2_5", pm10, nh3
            }
        }
    }
}
