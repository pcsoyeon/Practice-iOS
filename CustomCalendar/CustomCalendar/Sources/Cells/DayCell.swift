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
        image.isHidden = true
        return image
    }()
    var countLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(dataLabel)
        self.addSubview(characterImage)
        self.addSubview(countLabel)
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dataLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dataLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            characterImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            characterImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
            characterImage.heightAnchor.constraint(equalToConstant: 27),
            characterImage.widthAnchor.constraint(equalToConstant: 32),
            countLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            countLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 1)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
