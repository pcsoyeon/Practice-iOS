//
//  RecipeCVC.swift
//  FoodD-day
//
//  Created by soyeon on 2021/08/04.
//

import UIKit

class RecipeCVC: UICollectionViewCell {
    static let identifier = "RecipeCVC"

    // MARK: - UI Components
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var topImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var bottomImageView: UIImageView!
    
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    // MARK: - Local Variables
    
    private var count = 218000
    
    // MARK: - Life Cycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }
}

extension RecipeCVC {
    func setUI() {
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 15
        backView.layer.masksToBounds = true
        backView.layer.applyShadow()
        
//        backView.clipsToBounds = true
        
        topImageView.image = UIImage(named: "cake")
        topImageView.layer.cornerRadius = topImageView.frame.width / 2
        
        titleLabel.text = "다람"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        subTitleLabel.text = "@daram_table"
        subTitleLabel.textColor = .gray
        subTitleLabel.font = UIFont.systemFont(ofSize: 12)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        countLabel.text = "구독자 \(formatter.string(from: NSNumber(value: count))!)만명"
        countLabel.font = UIFont.boldSystemFont(ofSize: 7)
        
        bottomImageView.image = UIImage(named: "cake")
        bottomImageView.contentMode = .scaleToFill
        
        bottomImageView.layer.cornerRadius = 15
        bottomImageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        bottomImageView.layer.masksToBounds = true
        
        foodNameLabel.textColor = .white
        foodNameLabel.font = UIFont.systemFont(ofSize: 15)
        
        firstLabel.textColor = .white
        firstLabel.font = UIFont.systemFont(ofSize: 13)
        
        secondLabel.textColor = .white
        secondLabel.font = UIFont.systemFont(ofSize: 13)
    }
    
    func initCell(food: String, first: String, second: String) {
        foodNameLabel.text = "\(food)"
        
        firstLabel.text = first
        
        secondLabel.text = second
    }
}
