//
//  Weather.swift
//  Weather
//
//  Created by soyeon on 2021/08/07.
//

import Foundation

// MARK: - WeatherData
struct WeatherData: Codable {
    let data: [Datum]
    let count: Int
}

// MARK: - Data
struct Datum: Codable {
    let rh: Int
    let pod: String
    let lon, pres: Double
    let timezone, obTime, countryCode: String
    let clouds, ts, solarRAD: Int
    let stateCode, cityName: String
    let windSpd: Double
    let windCdirFull, windCdir: String
    let slp: Double
    let vis, hAngle: Int
    let sunset: String
    let dni: Int
    let dewpt: Double
    let snow, uv, precip, windDir: Int
    let sunrise: String
    let ghi, dhi, aqi: Int
    let lat: Double
    let weather: Weather
    let datetime: String
    let temp: Double
    let station: String
    let elevAngle, appTemp: Double

    enum CodingKeys: String, CodingKey {
        case rh, pod, lon, pres, timezone
        case obTime = "ob_time"
        case countryCode = "country_code"
        case clouds, ts
        case solarRAD = "solar_rad"
        case stateCode = "state_code"
        case cityName = "city_name"
        case windSpd = "wind_spd"
        case windCdirFull = "wind_cdir_full"
        case windCdir = "wind_cdir"
        case slp, vis
        case hAngle = "h_angle"
        case sunset, dni, dewpt, snow, uv, precip
        case windDir = "wind_dir"
        case sunrise, ghi, dhi, aqi, lat, weather, datetime, temp, station
        case elevAngle = "elev_angle"
        case appTemp = "app_temp"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let icon: String
    let code: Int
    let weatherDescription: String

    enum CodingKeys: String, CodingKey {
        case icon, code
        case weatherDescription = "description"
    }
}
