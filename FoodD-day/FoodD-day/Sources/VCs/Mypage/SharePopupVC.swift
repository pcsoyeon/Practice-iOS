//
//  SharePopupVC.swift
//  FoodD-day
//
//  Created by soyeon on 2021/08/01.
//

import UIKit

class SharePopupVC: UIViewController {

    // MARK: - UI Components
    
    @IBOutlet weak var backView: UIView!
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
}

extension SharePopupVC {
    func setUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 15
        backView.layer.masksToBounds = true
    }
}
