//
//  WeatherTVC.swift
//  Weather
//
//  Created by soyeon on 2021/08/11.
//

import UIKit
import Then

class WeatherTVC: UITableViewCell {
    static let identifier = "WeatherTVC"
    
    // MARK: - Properties
    
    private lazy var dayLabel = UILabel().then {
        $0.text = "날짜"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    
    private lazy var highTempLabel = UILabel().then {
        $0.text = "최고 기온"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.textAlignment = .center
    }
    
    private lazy var lowTempLabel = UILabel().then {
        $0.text = "최저 기온"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.textAlignment = .center
    }
    
    private lazy var iconImageView = UIImageView().then {
        $0.image = UIImage(systemName: "abc")
        $0.contentMode = .scaleAspectFit
    }

    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configUI() {
        addSubviews([dayLabel, highTempLabel, lowTempLabel, iconImageView])
        
        dayLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.centerY.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(150)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        lowTempLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
        }
        
        highTempLabel.snp.makeConstraints { make in
            make.leading.equalTo(lowTempLabel.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
    }

    func initCell(with model: DailyWeatherEntry) {
        lowTempLabel.text = "\(Int(model.temperatureLow))"
        highTempLabel.text = "\(Int(model.temperatureHigh))"
        
        dayLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.time)))
        
        let icon = model.icon.lowercased()
        if icon.contains("clear") {
            iconImageView.image = UIImage(named: "clear")
        } else if icon.contains("rain") {
            iconImageView.image = UIImage(named: "rain")
        } else if icon.contains("cloudy") {
            iconImageView.image = UIImage(named: "cloud")
        }
    }
    
    func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else { return "" }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate)
    }
}
