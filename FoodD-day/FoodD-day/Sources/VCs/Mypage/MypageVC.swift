//
//  MypageVC.swift
//  FoodD-day
//
//  Created by soyeon on 2021/07/31.
//

import UIKit

class MypageVC: UIViewController {

    // MARK: - UI Components
    
    @IBOutlet weak var shareCountLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    
    // MARK: - Local Variables
    
    private var shareCounts: Int = 0
    
    // MARK: - Life Cycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.isHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(addShareCounts), name: NSNotification.Name("shareCounts"), object: nil)
        shareCountLabel.text = "\(shareCounts)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        touchUpShare()
    }
}

// MARK: - UI

extension MypageVC {
    func setUI() {
        shareCountLabel.text = "\(shareCounts)"
        shareCountLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        shareLabel.text = "공유"
        shareLabel.textColor = UIColor.gray
    }
}

// MARK: - Action

extension MypageVC {
    func touchUpShare() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pushToShare(_:)))
//        shareCountLabel.isUserInteractionEnabled = true
//        shareCountLabel.addGestureRecognizer(tapGesture)
        
        shareLabel.isUserInteractionEnabled = true
        shareLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func pushToShare(_ sender: UITapGestureRecognizer) {
        guard let dvc = UIStoryboard(name: "Share", bundle: nil).instantiateViewController(withIdentifier: "ShareVC") as? ShareVC else {
            return
        }
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    @objc
    func addShareCounts(_ notification: Notification) {
        shareCounts = notification.object as! Int
    }
}
