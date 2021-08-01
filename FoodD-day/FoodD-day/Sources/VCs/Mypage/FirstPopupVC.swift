//
//  SharePopupVC.swift
//  FoodD-day
//
//  Created by soyeon on 2021/08/01.
//

import UIKit

class FirstPopupVC: UIViewController {

    // MARK: - UI Components
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var searchButton: UIButton!
    
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
    }
}

extension FirstPopupVC {
    func setNotificaiton() {
        NotificationCenter.default.addObserver(self, selector: #selector(presentShare), name: NSNotification.Name("presentShare"), object: nil)
    }
    
    @objc
    func presentShare() {
        print("공유 뷰로 이동")
        self.dismiss(animated: false, completion: nil)
    }
}

extension FirstPopupVC {
    func setAction() {
        let popToSecond = UIAction { _ in
            guard let dvc = UIStoryboard(name: "SecondPopup", bundle: nil).instantiateViewController(withIdentifier: "SecondPopupVC") as? SecondPopupVC else {
                return
            }
            dvc.modalPresentationStyle = .overFullScreen
            dvc.modalTransitionStyle = . crossDissolve
            self.present(dvc, animated: true, completion: nil)
        }
        searchButton.addAction(popToSecond, for: .touchUpInside)
    }
}
