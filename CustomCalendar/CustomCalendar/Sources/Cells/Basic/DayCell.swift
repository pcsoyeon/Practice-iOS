//
//  DayCell.swift
//  CustomCalendar
//
//  Created by soyeon on 2021/09/16.
//

import UIKit

class DayCell: UICollectionViewCell {
    static let identifier = "DayCell"
    
    var dataLabel = UILabel()
    
    var characterImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "charc")
        image.contentMode = .scaleAspectFit
        image.isHidden = true
        return image
    }()
    
    var countLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubviews(dataLabel, characterImage, countLabel)
        
        dataLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        characterImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(27)
            make.width.equalTo(32)
        }
        
        countLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(characterImage.snp.bottom).offset(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
