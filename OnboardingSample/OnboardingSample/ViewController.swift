//
//  ViewController.swift
//  OnboardingSample
//
//  Created by soyeon on 2021/06/30.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UIComponents
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var guideLabel1: UILabel!
    @IBOutlet weak var guideLabel2: UILabel!
   
    @IBOutlet weak var guideLabel3: UILabel!
    
    @IBOutlet weak var femaleButton: UIView!
    @IBOutlet weak var maleButton: UIView!
    
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel()
        setUIView()
    }

}

// MARK: - Custom Methods

extension ViewController {
    func setLabel() {
        progressLabel.text = "1/4"
        progressLabel.textColor = .darkGray
        
        guideLabel1.text = "성별을 알려주세요!"
        guideLabel1.font = UIFont.boldSystemFont(ofSize: 17)
        
        guideLabel2.text = "연령과 성별에 따라 많이 찾는 렌즈를 추천해드릴게요!"
        guideLabel2.textColor = .lightGray
        
        guideLabel3.text = "나이를 알려주세요!"
    }
    
    func setUIView() {
        femaleButton.layer.cornerRadius = 15
        femaleButton.layer.masksToBounds = true
        
        maleButton.layer.cornerRadius = 15
        maleButton.layer.masksToBounds = true
    }
}
