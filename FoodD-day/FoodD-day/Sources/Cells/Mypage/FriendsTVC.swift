//
//  FriendsTVC.swift
//  FoodD-day
//
//  Created by soyeon on 2021/08/01.
//

import UIKit

class FriendsTVC: UITableViewCell {
    static let identifier = "FriendsTVC"

    // MARK: - UI Components
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var relationLabel: UILabel!
    
    // MARK: - Life Cycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension FriendsTVC {
    func setUI() {
        nameLabel.text = "이름"
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        
        relationLabel.text = "관계"
        relationLabel.textColor = UIColor.gray
        relationLabel.font = UIFont.systemFont(ofSize: 10)
    }
    
    func initCell(icon: String, name: String, relation: String) {
        iconImageView.image = UIImage(named: icon)
        nameLabel.text = name
        relationLabel.text = relation
    }
}
