//
//  WeatherViewModel.swift
//  Weather
//
//  Created by soyeon on 2021/08/09.
//

import Foundation
import Moya

class WeatherViewModel {
    var weather: WeatherModel
    
    init(_ weatherModel: WeatherModel) {
        self.weather = weatherModel
    }
    
    var location: String {
        return weather.data[0].cityName
    }
    
    var date: String {
        self.dateFormatter.locale = Locale(identifier: "US")
        self.dateFormatter.dateFormat = "EE,MM.dd.yyyy"
        return dateFormatter.string(from: Date())
    }
   
    var weatherImage: String {
        return ""
    }
    
    var temp: String {
        return String(weather.data[0].temp)
    }
    
    var description: String {
        return weather.data[0].weather.weatherDescription
    }
    
    // MARK: - Local Variables
    
    private var dateFormatter = DateFormatter()
    
    // MARK: - UI
    
    func configUI(_ view: WeatherView) {
        view.locationLabel.text = location
        view.dateLabel.text = date
        view.weatherImageView.image = UIImage(named: weatherImage)
        view.tempLabel.text = temp
        view.descriptionLabel.text = description
    }
}
