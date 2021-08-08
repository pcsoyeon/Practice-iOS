//
//  ViewController.swift
//  Weather
//
//  Created by soyeon on 2021/08/07.
//

import UIKit
import SnapKit
import Then
import Moya

class MainVC: UIViewController {
    
    // MARK: - Properties
    
    private var locationLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    private var dateLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    
    private var weatherImageView = UIImageView().then {
        guard let image = UIImage(named: "abc") else { return }
        $0.image = image
    }
    
    private var weatherLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    private var descriptionLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.numberOfLines = 2
    }
    
    // MARK: - Local Variables
    private let authProvider = MoyaProvider<WeatherService>()
    private var currentWeather:CurrentWeatherService!
    
    private var dateFormatter = DateFormatter()

     //MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
//        getWeather()
        getCurrentWeather()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setConstraints()
    }
}

extension MainVC {
    func configUI() {
        view.backgroundColor = .wtGreen
    }
    
    func setConstraints() {
        view.addSubviews([locationLabel, dateLabel, weatherImageView, weatherLabel, descriptionLabel])
        
        locationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(locationLabel.snp.bottom).offset(10)
        }
        
        weatherImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
        }
        
        weatherLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(weatherImageView.snp.bottom).offset(10)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(weatherLabel.snp.bottom).offset(20)
        }
    }
}

extension MainVC {
    private func getWeather() {
        
        let param: WeatherRequest = WeatherRequest.init(GeneralAPI.apiKey)
        
        authProvider.request(.current(param: param)) { response in
            switch response {
            case .success(let result):
                do {
                    dump(result)
                    let data = try result.map(WeatherData.self)
                    dump(data)
                } catch(let err) {
                    print("디코드 안됨 - ", err.localizedDescription)
                }
            case .failure(let err):
                print("데이터 못 받음 - ",err.localizedDescription)
            }
        }
    }
    
    private func getCurrentWeather() {
        currentWeather = CurrentWeatherService()
        currentWeather.getCurrentWeather() { (success) in
            dump(self.currentWeather)
            self.locationLabel.text = self.currentWeather.city
            
            self.dateFormatter.locale = Locale(identifier: "ko_KR")
            self.dateFormatter.dateFormat = "yyyy.MM.dd"
            self.dateLabel.text = self.dateFormatter.string(from: Date())
            
            self.weatherLabel.text = self.currentWeather.weatherType
            self.weatherImageView.image = getWeatherIconFor(self.currentWeather.weatherIcon)
            self.descriptionLabel.text = "해 뜨는 시간: \(self.currentWeather.sunset)\n해 지는 시간: \(self.currentWeather.sunrise)"
        }
    }
}
