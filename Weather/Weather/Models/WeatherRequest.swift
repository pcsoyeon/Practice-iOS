//
//  WeatherRequest.swift
//  Weather
//
//  Created by soyeon on 2021/08/07.
//

import Foundation

struct WeatherRequest: Codable {
    var api_key: String
    var latitude: Double
    var longtitude: Double
    
    init(_ api_key: String, _ latitude: Double = 35.7796, _ longtitude:Double = -78.6382) {
        self.api_key = api_key
        self.latitude = latitude
        self.longtitude = longtitude
    }
}
