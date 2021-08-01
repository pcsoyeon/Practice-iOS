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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var xButton: UIButton!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    // MARK: - Local Variables
    
    var newFriend = FriendsDataModel(icon: "pWalnut", name: "", relaiton: "")
    
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
        backView.layer.cornerRadius = 15
        backView.layer.masksToBounds = true
        
        titleLabel.text = "구성원 추가하기"
        titleLabel.textColor = .fdMainGreen
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        
        xButton.setTitle("", for: .normal)
        xButton.tintColor = .black
        xButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        
        userImageView.image = UIImage(named: "pWalnut")
        
        nameLabel.text = "호두"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        
        nameTextField.placeholder = "구성원 이름"
        
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
            if self.nameTextField.text!.isEmpty {
                return
            }
            self.newFriend.name = self.nameTextField.text ?? ""
            self.dismiss(animated: false) {
                NotificationCenter.default.post(name: NSNotification.Name("presentShare"), object: nil)
            }
            NotificationCenter.default.post(name: NSNotification.Name("addFriends"), object: self.newFriend)
        }
        addButton.addAction(add, for: .touchUpInside)
    }
}
