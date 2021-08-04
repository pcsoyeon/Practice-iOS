//
//  CategoryCVC.swift
//  FoodD-day
//
//  Created by soyeon on 2021/08/03.
//

import UIKit

class CategoryCVC: UICollectionViewCell {
    static let identifier = "CategoryCVC"
    
    // MARK: - UI Components
    
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var underLineView: UIView!
    @IBOutlet weak var underLineHeight: NSLayoutConstraint!
    
    // MARK: - Life Cycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                circleView.layer.borderWidth = 1
                circleView.layer.borderColor = UIColor.fdMainGreen.cgColor
                
                categoryLabel.textColor = .fdMainGreen
                
                underLineHeight.constant = 3
                underLineView.layoutIfNeeded()
                
                underLineView.backgroundColor = .fdMainGreen
            } else {
                circleView.layer.borderWidth = 0
                
                categoryLabel.textColor = .black
                
                underLineHeight.constant = 1
                underLineView.layoutIfNeeded()
                
                underLineView.backgroundColor = .systemGray5
            }
        }
    }
}

extension CategoryCVC {
    func setUI() {
        circleView.layer.cornerRadius = circleView.frame.width / 2
        circleView.layer.masksToBounds = true
        circleView.layer.applyShadow()
        
        categoryLabel.text = "카레고리"
        categoryLabel.textColor = .black
        categoryLabel.font = UIFont.systemFont(ofSize: 13)
        
        underLineHeight.constant = 1
        
        underLineView.backgroundColor = .systemGray5
    }
    
    func initCell(image: String, category: String) {
        categoryImageView.image = UIImage(named: image)
        categoryLabel.text = category
    }
}
