//
//  BrandListCVC.swift
//  OnboardingSample2
//
//  Created by soyeon on 2021/07/01.
//

import UIKit

class BrandListCVC: UICollectionViewCell {
    static let identifier = "BradListCVC"
    
    // MARK: - UI Components
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                label.textColor = UIColor.orange
            } else {
                label.textColor = UIColor.darkGray
            }
        }
    }
    
    // MARK: - Initializer
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        setConstraint()
//    }
//
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    // MARK: - LifeCycles
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setConstraint()
    }
    
}

extension BrandListCVC {
    func setCell(brandName: String) {
        label.text = brandName
        label.sizeToFit()
    }
    
    func setConstraint() {
        contentView.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
