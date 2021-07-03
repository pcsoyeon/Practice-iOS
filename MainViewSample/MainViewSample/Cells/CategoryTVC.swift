//
//  CategoryTVC.swift
//  MainViewSample
//
//  Created by soyeon on 2021/07/03.
//

import UIKit

class CategoryTVC: UITableViewCell {
    static let identifier = "CategoryTVC"
    
    // MARK: - UI Components
    @IBOutlet weak var categoryListCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
        registerNib()
        setCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension CategoryTVC {
    func setUI() {
        contentView.backgroundColor = .blue
    }
    
    func registerNib() {
        let categoryNib = UINib(nibName: CategoryCVC.identifier, bundle: nil)
        categoryListCollectionView.register(categoryNib, forCellWithReuseIdentifier: CategoryCVC.identifier)
    }
    
    func setCollectionView() {
        categoryListCollectionView.delegate = self
        categoryListCollectionView.dataSource = self
        
        categoryListCollectionView.isScrollEnabled = false
    }
}

extension CategoryTVC: UICollectionViewDelegate {
    
}

extension CategoryTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.identifier, for: indexPath) as? CategoryCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension CategoryTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let cellWidth = (width - 30) / 4
        return CGSize(width: cellWidth, height: 74)
    }
}
