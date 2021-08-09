//
//  Weather.swift
//  Weather
//
//  Created by soyeon on 2021/08/07.
//

import Foundation

// MARK: - WeatherData
struct WeatherModel: Codable {
    let data: [WeatherResponse]
    let count: Int
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        data = (try? values.decode([WeatherResponse].self, forKey: .data)) ?? []
        count = (try? values.decode(Int.self, forKey: .count)) ?? 1
    }
}

// MARK: - Data
struct WeatherResponse: Codable {
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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        rh = (try? values.decode(Int.self, forKey: .rh)) ?? 0
        pod = (try? values.decode(String.self, forKey: .pod)) ?? ""
        lon = (try? values.decode(Double.self, forKey: .lon)) ?? 0
        pres = (try? values.decode(Double.self, forKey: .pres)) ?? 0
        timezone = (try? values.decode(String.self, forKey: .timezone)) ?? ""
        obTime = (try? values.decode(String.self, forKey: .obTime)) ?? ""
        countryCode = (try? values.decode(String.self, forKey: .countryCode)) ?? ""
        clouds = (try? values.decode(Int.self, forKey: .clouds)) ?? 0
        ts = (try? values.decode(Int.self, forKey: .ts)) ?? 0
        solarRAD = (try? values.decode(Int.self, forKey: .solarRAD)) ?? 0
        stateCode = (try? values.decode(String.self, forKey: .stateCode)) ?? ""
        cityName = (try? values.decode(String.self, forKey: .cityName)) ?? ""
        windSpd = (try? values.decode(Double.self, forKey: .windSpd)) ?? 0
        windCdirFull = (try? values.decode(String.self, forKey: .windCdirFull)) ?? ""
        windCdir = (try? values.decode(String.self, forKey: .windCdir)) ?? ""
        slp = (try? values.decode(Double.self, forKey: .slp)) ?? 0
        vis = (try? values.decode(Int.self, forKey: .vis)) ?? 0
        hAngle = (try? values.decode(Int.self, forKey: .hAngle)) ?? 0
        sunset = (try? values.decode(String.self, forKey: .sunset)) ?? ""
        dni = (try? values.decode(Int.self, forKey: .dni)) ?? 0
        dewpt = (try? values.decode(Double.self, forKey: .dewpt)) ?? 0
        snow = (try? values.decode(Int.self, forKey: .snow)) ?? 0
        uv = (try? values.decode(Int.self, forKey: .uv)) ?? 0
        precip = (try? values.decode(Int.self, forKey: .precip)) ?? 0
        windDir = (try? values.decode(Int.self, forKey: .windDir)) ?? 0
        sunrise = (try? values.decode(String.self, forKey: .sunrise)) ?? ""
        ghi = (try? values.decode(Int.self, forKey: .ghi)) ?? 0
        dhi = (try? values.decode(Int.self, forKey: .dhi)) ?? 0
        aqi = (try? values.decode(Int.self, forKey: .aqi)) ?? 0
        lat = (try? values.decode(Double.self, forKey: .lat)) ?? 0
        datetime = (try? values.decode(String.self, forKey: .datetime)) ?? ""
        temp = (try? values.decode(Double.self, forKey: .temp)) ?? 0
        station = (try? values.decode(String.self, forKey: .station)) ?? ""
        elevAngle = (try? values.decode(Double.self, forKey: .elevAngle)) ?? 0
        appTemp = (try? values.decode(Double.self, forKey: .appTemp)) ?? 0
        weather = (try? values.decode(Weather.self, forKey: .weather))!
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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        icon = (try? values.decode(String.self, forKey: .icon)) ?? ""
        code = (try? values.decode(Int.self, forKey: .code)) ?? 0
        weatherDescription = (try? values.decode(String.self, forKey: .weatherDescription)) ?? ""
    }
}
