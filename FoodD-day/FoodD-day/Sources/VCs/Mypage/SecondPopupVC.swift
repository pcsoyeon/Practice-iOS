//
//  SecondPopupVC.swift
//  FoodD-day
//
//  Created by soyeon on 2021/08/01.
//

import UIKit

class SecondPopupVC: UIViewController {
    
    // MARK: - UI Components
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    // MARK: - Local Variables
    
    var newFriends = FriendsDataModel(icon: "pWalnut", name: "", relaiton: "")
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAcion()
    }
}

extension SecondPopupVC {
    func setUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0)
        
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 5
        backView.layer.masksToBounds = true
        
        xButton.setTitle("", for: .normal)
        xButton.setImage(UIImage(named: "xMark"), for: .normal)
        
        addButton.setTitle("추가", for: .normal)
        addButton.titleLabel?.tintColor = .white
        addButton.backgroundColor = UIColor.fdMainGreen
        addButton.layer.cornerRadius = 15
        addButton.layer.masksToBounds = true
    }
}

extension SecondPopupVC {
    func setAcion() {
        let dismiss = UIAction { _ in
            self.dismiss(animated: false) {
                NotificationCenter.default.post(name: NSNotification.Name("presentShare"), object: nil)
            }
        }
        xButton.addAction(dismiss, for: .touchUpInside)
        
        let add = UIAction { _ in
            self.dismiss(animated: false) {
                NotificationCenter.default.post(name: NSNotification.Name("presentShare"), object: nil)
            }
            NotificationCenter.default.post(name: NSNotification.Name("addFriends"), object: self.newFriends)
        }
        addButton.addAction(add, for: .touchUpInside)
    }
}
