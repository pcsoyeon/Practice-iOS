//
//  ViewController.swift
//  OnboardingSample2
//
//  Created by soyeon on 2021/06/30.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - UIComponents
    
    @IBOutlet weak var brandSelectButtonView: UIView!
    @IBOutlet weak var lensInputView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private lazy var listView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.darkGray.cgColor
        return view
    }()
    
    let brandListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemGray6
        
        return collection
    }()
    
    private lazy var selectButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("선택 완료", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    // MARK: - Local Variables
    
    private var isPresentListView: Bool = false
    private var listViewHeight: NSLayoutConstraint!
    
    private let brandList = ["오렌즈", "렌즈미", "오렌즈",
                             "렌즈미", "오렌즈", "렌즈미",
                             "오렌즈", "렌즈미", "오렌즈",
                             "렌즈미", "오렌즈", "렌즈미",
                             "오렌즈", "렌즈미"]
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setInitialView()
        setBrandSelectView()
        
        setBrandListCollectionView()
    }
}

// MARK: - Custom Methods

extension ViewController {
    func setUI() {
        view.addSubview(listView)
        view.addSubview(selectButton)
        
        listView.snp.makeConstraints { make in
            make.top.equalTo(brandSelectButtonView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(brandSelectButtonView)
            make.height.equalTo(1)
        }
        
        selectButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(startButton)
            make.height.equalTo(startButton)
        }
        
        startButton.layer.cornerRadius = 10
        startButton.layer.masksToBounds = true
    }
    
    func setInitialView() {
        listView.isHidden = true
        selectButton.isHidden = true
    }
    
    func setBrandSelectView() {
        let brandTapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpBrandSelectView(_:)))
        
        brandSelectButtonView.addGestureRecognizer(brandTapGesture)
        
        listView.addSubview(brandListCollectionView)
        
        brandListCollectionView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setBrandListCollectionView() {
        brandListCollectionView.delegate = self
        brandListCollectionView.dataSource = self
        
        brandListCollectionView.register(BrandListCVC.self, forCellWithReuseIdentifier: BrandListCVC.identifier)
    }
}

// MARK: - Action Methods

extension ViewController {
    @objc
    func touchUpBrandSelectView(_ sender: UITapGestureRecognizer) {
        if isPresentListView {
            isPresentListView = false
            
            self.listView.snp.updateConstraints { make in
                make.height.equalTo(0)
            }
            
            UIView.animate(withDuration: 1, animations: {
                self.view.layoutIfNeeded()
            }) { _ in
                self.selectButton.isHidden = true
            }

        } else {
            listView.isHidden = false
            isPresentListView = true
            
            self.listView.snp.updateConstraints { make in
                make.height.equalTo(400)
            }
            
            UIView.animate(withDuration: 1, animations: {
                self.view.layoutIfNeeded()
            }) { _ in
                self.selectButton.isHidden = false
            }
        }
    }
}

// MARK: - UICollectionView Delegate

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brandList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandListCVC.identifier, for: indexPath) as? BrandListCVC else { return UICollectionViewCell() }
        cell.awakeFromNib()
        cell.setCell(brandName: brandList[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 70
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
