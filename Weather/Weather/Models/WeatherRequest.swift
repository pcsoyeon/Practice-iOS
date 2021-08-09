//
//  WeatherRequest.swift
//  Weather
//
//  Created by soyeon on 2021/08/07.
//

import Foundation

struct WeatherRequest: Codable {
    var lat: Double
    var lon: Double
    var key: String
    
    init(_ lat: Double = 35.7796, _ lon:Double = -78.6382, _ key: String) {
        self.lat = lat
        self.lon = lon
        self.key = key
    }
}
