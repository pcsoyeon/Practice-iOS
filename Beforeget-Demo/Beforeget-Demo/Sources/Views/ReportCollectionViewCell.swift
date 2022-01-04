//
//  ReportCollectionViewCell.swift
//  Beforeget-Demo
//
//  Created by soyeon on 2022/01/05.
//

import UIKit

class ReportCollectionViewCell: UICollectionViewCell {
    static let identifier = "ReportCollectionViewCell"
    
    // MARK: - Properties
    
    private lazy var dateBackView = UIView().then {
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 1
    }
    
    private lazy var dateLabel = UILabel().then {
        $0.text = "2021년 12월"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private lazy var grapicBackView = UIView().then {
        $0.backgroundColor = .darkGray
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {

    }
    
    // MARK: - Custom Methods
    
    private func configUI() {
        backgroundColor = .systemBackground
    }
}
