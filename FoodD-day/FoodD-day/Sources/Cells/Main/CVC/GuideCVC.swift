//
//  GuideCVC.swift
//  FoodD-day
//
//  Created by soyeon on 2021/08/04.
//

import UIKit

class GuideCVC: UICollectionViewCell {
    static let identifier = "GuideCVC"

    // MARK: - UI Components
    
    @IBOutlet weak var guideLabel: UILabel!
    @IBOutlet weak var subGuideLabel: UILabel!
    
    @IBOutlet weak var guideImageView: UIImageView!
    
    // MARK: - Life Cycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }
}

extension GuideCVC {
    func setUI() {
        backgroundColor = .fdMainGreen
        
        guideLabel.textColor = .white
        guideLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        subGuideLabel.text = "푸드 디데이와 함께 냉장고를 지켜봐요!"
        subGuideLabel.textColor = .white
        subGuideLabel.font = UIFont.systemFont(ofSize: 13)
    }
    
    func initCell(guide: String, image: String) {
        guideLabel.text = guide
        
        guideImageView.image = UIImage(named: image)
    }
}
