//
//  SharePopupVC.swift
//  FoodD-day
//
//  Created by soyeon on 2021/08/01.
//

import UIKit

class FirstPopupVC: UIViewController {

    // MARK: - UI Components
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var xButton: UIButton!
    
    @IBOutlet weak var guideLabel: UILabel!
    @IBOutlet weak var copyLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var searchButton: UIButton!
    
    var saveData: ((FriendsDataModel) -> Void)?
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAction()
        setNotificaiton()
    }
}

extension FirstPopupVC {
    func setUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 15
        backView.layer.masksToBounds = true
        
        titleLabel.text = "구성원 추가하기"
        titleLabel.textColor = .fdMainGreen
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        
        xButton.setTitle("", for: .normal)
        xButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        xButton.tintColor = .black
        
        guideLabel.text = "함께 냉장고를 사용할 구성원을 추가해보세요!"
        guideLabel.textColor = .black
        guideLabel.font = UIFont.systemFont(ofSize: 13)
        
        searchTextField.placeholder = "구성원 닉네임 입력"
        
        searchButton.setTitle("검색", for: .normal)
        searchButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        searchButton.titleLabel?.tintColor = .white
        searchButton.backgroundColor = .fdMainGreen
        searchButton.layer.cornerRadius = 15
        searchButton.layer.masksToBounds = true
        
        copyLabel.text = "초대링크 복사하기"
        copyLabel.textColor = .black
        copyLabel.font = UIFont.systemFont(ofSize: 14)
    }
}

extension FirstPopupVC {
    func setNotificaiton() {
        NotificationCenter.default.addObserver(self, selector: #selector(presentShare), name: NSNotification.Name("presentShare"), object: nil)
    }
    
    @objc
    func presentShare() {
        self.dismiss(animated: false, completion: nil)
    }
}

extension FirstPopupVC {
    func setAction() {
        let dismiss = UIAction { _ in
            self.dismiss(animated: true, completion: nil)
            return
        }
        xButton.addAction(dismiss, for: .touchUpInside)
        
        let presentToSecond = UIAction { _ in
            guard let dvc = UIStoryboard(name: "SecondPopup", bundle: nil).instantiateViewController(withIdentifier: "SecondPopupVC") as? SecondPopupVC else {
                return
            }
            dvc.modalPresentationStyle = .overFullScreen
            dvc.modalTransitionStyle = . crossDissolve
            self.present(dvc, animated: true, completion: nil)
        }
        searchButton.addAction(presentToSecond, for: .touchUpInside)
    }
}
