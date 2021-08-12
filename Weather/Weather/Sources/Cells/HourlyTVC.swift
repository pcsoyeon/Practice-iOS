//
//  HourlyTVC.swift
//  Weather
//
//  Created by soyeon on 2021/08/12.
//

import UIKit
import SnapKit

class HourlyTVC: UITableViewCell {
    static let identifier = "HourlyTVC"
    
    // MARK: - Properties
    
    private var hourlyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        
        return collectionView
    }()
    
    // MARK: - Local Variables
    
    var hourlyWeather: HourlyWeather?
    private var models = [HourlyWeatherEntry]()
    
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configUI()
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension HourlyTVC {
    func configUI() {
        backgroundColor = .white
        
        contentView.addSubview(hourlyCollectionView)
        
        hourlyCollectionView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setCollectionView() {
        hourlyCollectionView.backgroundColor = .white
        
        hourlyCollectionView.delegate = self
        hourlyCollectionView.dataSource = self
        
        hourlyCollectionView.register(HourlyCVC.self, forCellWithReuseIdentifier: HourlyCVC.identifier)
    }
    
    func initCell(with models: [HourlyWeatherEntry]) {
        self.models = models
        hourlyCollectionView.reloadData()
    }
}

extension HourlyTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 4
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

extension HourlyTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCVC.identifier, for: indexPath) as? HourlyCVC else {
            return UICollectionViewCell()
        }
        cell.initCell(icon: models[indexPath.row].icon, temp: models[indexPath.row].temperature)
        return cell
    }
}
