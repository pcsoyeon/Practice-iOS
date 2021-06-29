//
//  AgeListCVC.swift
//  OnboardingSample
//
//  Created by soyeon on 2021/06/30.
//

import UIKit

class AgeListCVC: UICollectionViewCell {
    static let identifier = "AgeListCVC"
    
    // MARK: - UIComponents
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var ageLabel: UILabel!
    
//    let ageLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 16)
//        label.textColor = UIColor.darkGray
//        
//        return label
//    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backView.backgroundColor = .white
                backView.layer.borderColor = UIColor.systemRed.cgColor
                self.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
                
                ageLabel.font = .boldSystemFont(ofSize: 15)
                ageLabel.textColor = .orange
                
            } else {
                backView.backgroundColor = .systemGray6
                backView.layer.borderColor = UIColor.systemGray5.cgColor
                self.layer.shadowColor = UIColor.white.cgColor
                
                ageLabel.font = .systemFont(ofSize: 15)
                ageLabel.textColor = .darkGray
            }
            backView.layer.borderWidth = 1
            backView.layer.cornerRadius = 10
        }
    }
    
    // MARK: - Initializer
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setViewShadow(backView: backView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        setConstraint()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Custom Methods

extension AgeListCVC {
    func setCell(age: String) {
        ageLabel.text = age
    }
    
//    func setConstraint() {
//        contentView.addSubview(ageLabel)
//
//        let centerXAnchor = ageLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
//        centerXAnchor.isActive = true
//
//        let centerYAnchor = ageLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
//        centerYAnchor.isActive = true
//    }
}
