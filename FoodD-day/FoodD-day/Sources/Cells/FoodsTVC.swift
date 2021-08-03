//
//  FoodsTVC.swift
//  FoodD-day
//
//  Created by soyeon on 2021/08/03.
//

import UIKit

class FoodsTVC: UITableViewCell {
    static let identifier = "FoodsTVC"

    // MARK: - UI Components
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodLabel: UILabel!
    
    @IBOutlet weak var firstTagLabel: UILabel!
    @IBOutlet weak var secondTagLabel: UILabel!
    
    @IBOutlet weak var deadlineView: UIView!
    @IBOutlet weak var deadlineLabel: UILabel!
    
    @IBOutlet weak var expiryView: UIView!
    @IBOutlet weak var expiryLabel: UILabel!
    
    // MARK: - Life Cycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension FoodsTVC {
    func setUI() {
        backView.backgroundColor = .white
        
        backView.layer.cornerRadius = 15
        backView.layer.masksToBounds = true
        backView.layer.applyShadow()
        
        foodLabel.textColor = .black
        foodLabel.font = UIFont.systemFont(ofSize: 13)
        
        firstTagLabel.textColor = .gray
        firstTagLabel.font = UIFont.systemFont(ofSize: 11)
        
        secondTagLabel.textColor = .gray
        secondTagLabel.font = UIFont.systemFont(ofSize: 11)
        
        deadlineView.backgroundColor = .fdPurple
        deadlineView.layer.cornerRadius = 10
        deadlineView.layer.masksToBounds = true
        
        expiryView.backgroundColor = .fdYellow
        expiryView.layer.cornerRadius = 10
        expiryView.layer.masksToBounds = true
        
        deadlineLabel.textColor = .white
        deadlineLabel.font = UIFont.systemFont(ofSize: 10)
        
        expiryLabel.textColor = .black
        expiryLabel.font = UIFont.systemFont(ofSize: 10)
    }
    
    func initCell(image: String, name: String, firstTag: String, secondTag: String, deadline: String, expiryDay: String) {
        foodImageView.image = UIImage(named: image)
        
        foodLabel.text = name
        
        firstTagLabel.text = firstTag
        secondTagLabel.text = secondTag
        
        deadlineLabel.text = deadline
        expiryLabel.text = expiryDay
    }
}
