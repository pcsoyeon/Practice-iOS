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
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var guideLabel1: UILabel!
    @IBOutlet weak var guideLabel2: UILabel!
   
    @IBOutlet weak var guideLabel3: UILabel!
    
    @IBOutlet weak var femaleButton: UIView!
    @IBOutlet weak var maleButton: UIView!
    
    @IBOutlet weak var ageListCollectionView: UICollectionView!
    
    // MARK: - Local Variables
    
    private var isMaleSelected = false
    private var isFemaleSelected = false
    
    private let ageList = ["10대", "20대", "30대", "40대 이상"]
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel()
        setUIView()
        setProgressBar()
        touchUpGender()
        
        setCollectionView()
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
        guideLabel3.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    func setUIView() {
        femaleButton.layer.cornerRadius = 15
        femaleButton.layer.masksToBounds = true
        femaleButton.layer.borderWidth = 1
        femaleButton.layer.borderColor = UIColor.lightGray.cgColor
        femaleButton.layer.applyShadow()
        
        maleButton.layer.cornerRadius = 15
        maleButton.layer.masksToBounds = true
        maleButton.layer.borderWidth = 1
        maleButton.layer.borderColor = UIColor.lightGray.cgColor
        maleButton.layer.applyShadow()
    }
    
    func setProgressBar() {
        UIView.animate(withDuration: 0.3) {
            if self.progressView.progress != 0.25 {
                self.progressView.setProgress(0.25, animated: true)
            }
        }
    }
    
    func setCollectionView() {
        ageListCollectionView.delegate = self
        ageListCollectionView.dataSource = self
    }
}

// MARK: - Action Methods

extension ViewController {
    func touchUpGender() {
        let femaleTapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpFemaleButton))
        femaleButton.addGestureRecognizer(femaleTapGesture)
        
        let maleTapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpMaleButton(_:)))
        maleButton.addGestureRecognizer(maleTapGesture)
    }
    
    @objc
    func touchUpFemaleButton(_ sender: UITapGestureRecognizer) {
        if !isMaleSelected {
            maleButton.layer.borderColor = UIColor.lightGray.cgColor
            femaleButton.layer.borderColor = UIColor.orange.cgColor
        } else {
            femaleButton.layer.borderColor = UIColor.lightGray.cgColor
            maleButton.layer.borderColor = UIColor.orange.cgColor
        }
        
    }
    
    @objc
    func touchUpMaleButton(_ sender: UITapGestureRecognizer) {
        if !isFemaleSelected {
            maleButton.layer.borderColor = UIColor.orange.cgColor
            femaleButton.layer.borderColor = UIColor.lightGray.cgColor
        } else {
            femaleButton.layer.borderColor = UIColor.orange.cgColor
            maleButton.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
}

// MARK: - UICollectionView Delegate
extension ViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionView DataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AgeListCVC.identifier, for: indexPath) as? AgeListCVC else {
            return UICollectionViewCell()
        }
        cell.setCell(age: ageList[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionView DelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}
