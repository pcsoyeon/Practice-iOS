//
//  WeatherView.swift
//  Weather
//
//  Created by soyeon on 2021/08/09.
//

import UIKit

class WeatherView: UIView {
    
    // MARK: - Properties
    
    var locationLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    var dateLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    
    var weatherImageView = UIImageView().then {
        guard let image = UIImage(named: "abc") else { return }
        $0.image = image
    }
    
    var tempLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    var descriptionLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.numberOfLines = 2
    }

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .wtGreen
        
        addSubviews([locationLabel, dateLabel, weatherImageView, tempLabel, descriptionLabel])
        
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
        
        tempLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(weatherImageView.snp.bottom).offset(10)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(tempLabel.snp.bottom).offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder:) is not supported")
    }
}
