//
//  ViewController.swift
//  CarouselEffect
//
//  Created by soyeon on 2021/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCollectionView()
        collectionView.backgroundColor = .clear
        self.view.backgroundColor = .systemGray6
    }
    
    func addCollectionView(){

        let layout = CarouselLayout()
        
        layout.itemSize = CGSize(width: collectionView.frame.size.width * 0.796, height: collectionView.frame.size.height)
        layout.sideItemScale = 175 / 251
        layout.spacing = -197
        layout.isPagingEnabled = true
        layout.sideItemAlpha = 0.5

        collectionView.collectionViewLayout = layout
            
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self

        self.collectionView?.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.identifier)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.identifier, for: indexPath) as? CarouselCell else { return UICollectionViewCell() }
        cell.customView.backgroundColor = .white
        return cell
    }
}
