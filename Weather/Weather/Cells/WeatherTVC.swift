//
//  WeatherTVC.swift
//  Weather
//
//  Created by soyeon on 2021/08/11.
//

import UIKit

class WeatherTVC: UITableViewCell {
    static let identifier = "WeatherTVC"

    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
