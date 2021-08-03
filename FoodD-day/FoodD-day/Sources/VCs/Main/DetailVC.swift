//
//  DetailVC.swift
//  FoodD-day
//
//  Created by soyeon on 2021/08/03.
//

import UIKit

class DetailVC: UIViewController {

    // MARK: - UI Components
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodView: UIView!
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAction()
    }
}

extension DetailVC {
    func setUI() {
        foodView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        foodImageView.image = UIImage(named: "cheese")
        foodImageView.contentMode = .scaleAspectFill
        
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 25
        backView.layer.masksToBounds = true
        
        backButton.setTitle("", for: .normal)
        backButton.tintColor = .white
        backButton.setImage(UIImage(named: "back"), for: .normal)
    }
    
    func setAction() {
        let dismiss = UIAction { _ in
            self.navigationController?.popViewController(animated: true)
        }
        backButton.addAction(dismiss, for: .touchUpInside)
    }
}

extension DetailVC {
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
