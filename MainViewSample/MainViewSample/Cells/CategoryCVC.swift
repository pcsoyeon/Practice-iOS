//
//  CategoryCVC.swift
//  MainViewSample
//
//  Created by soyeon on 2021/07/03.
//

import UIKit

class CategoryCVC: UICollectionViewCell {
    static let identifier = "CategoryCVC"
    
    // MARK: - UI Components
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }

}

extension CategoryCVC {
    func setUI() {
        contentView.backgroundColor = .red
    }
    
    func initCell(categoryImage: String, categoryName: String) {
        categoryImageView.image = UIImage(named: categoryImage)
        categoryLabel.text = categoryName
    }
}
