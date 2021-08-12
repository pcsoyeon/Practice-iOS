//
//  HourlyCVC.swift
//  Weather
//
//  Created by soyeon on 2021/08/12.
//

import UIKit

class HourlyCVC: UICollectionViewCell {
    static let identifier = "HourlyCVC"
    
    // MARK: - Properties
    
    private lazy var iconImageView = UIImageView().then {
        $0.image = UIImage(systemName: "abc")
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var tempLabel = UILabel().then {
        $0.text = "온도"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HourlyCVC {
    func configUI() {
        backgroundColor = .white
        
        contentView.addSubviews([iconImageView, tempLabel])
        
        iconImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(100)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    func initCell(icon: String, temp: Double) {
        if icon.contains("clear") {
            iconImageView.image = UIImage(named: "clear")
        } else if icon.contains("cloudy") {
            iconImageView.image = UIImage(named: "cloud")
        } else {
            iconImageView.image = UIImage(named: "rain")
        }
        
        tempLabel.text = "\(temp)"
    }
}
