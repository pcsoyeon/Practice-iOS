//
//  ViewController.swift
//  FoodD-day
//
//  Created by soyeon on 2021/07/31.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: - UI Components
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var countBackView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var sortButton: UIButton!
    
    @IBOutlet weak var deadlineColorView: UIView!
    @IBOutlet weak var deadlineLabel: UILabel!
    
    
    @IBOutlet weak var listTableView: UITableView!
    
    // MARK:- Local Variables
    
    private var foods = [FoodsDataModel]()
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setList()
        
        registerXib()
        setTableView()
        setCollectionView()
    }
}

// MARK: - UI
extension MainVC {
    func setUI() {
        navigationController?.navigationBar.isHidden = true
        
        topView.backgroundColor = .fdMainGreen
        topView.layer.cornerRadius = 15
        topView.layer.masksToBounds = true
    }
    
    func setList() {
        foods.append(contentsOf: [
            FoodsDataModel(image: "", name: "치즈", firstTag: "", secondTag: "", deadline: "", expiryDay: ""),
            FoodsDataModel(image: "", name: "소금", firstTag: "", secondTag: "", deadline: "", expiryDay: "")
        ])
    }
    
    func registerXib() {
        
    }
    
    func setTableView() {
        
    }
    
    func setCollectionView() {
        
    }
}

// MARK:- UITableView

extension MainVC: UITableViewDelegate {
    
}

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

// MARK:- UICollectionView
