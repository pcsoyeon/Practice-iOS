//
//  ViewController.swift
//  Weather
//
//  Created by soyeon on 2021/08/07.
//

import UIKit
import SnapKit
import Then

class MainVC: UIViewController {
    
    // MARK: - Properties
    
    private var locationLabel = UILabel().then {
        $0.text = "위치"
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    private var dateLabel = UILabel().then {
        $0.text = "날짜"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    
    private var weatherImageView = UIImageView().then {
        guard let image = UIImage(named: "abc") else { return }
        $0.image = image
    }
    
    private var weatherLabel = UILabel().then {
        $0.text = "날씨"
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    private var descriptionLabel = UILabel().then {
        $0.text = "날씨 상세 정보"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12)
    }

     //MARK: - Life Cycle
    
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
