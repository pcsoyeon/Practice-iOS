//
//  CategoryTVC.swift
//  TextField-Example
//
//  Created by soyeon on 2021/10/08.
//

import UIKit

class CategoryTVC: UITableViewCell {
    static let identifier = "CategoryTVC"
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension CategoryTVC {
    func initUI() {
        categoryLabel.text = "디지털기기"
    }
}
