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
    
    private var categorys = [CategoryDataModel]()
    private var foods = [FoodsDataModel]()
    
    // MARK: - Life Cycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        countLabel.text = "품목 \(foods.count)"
    }
    
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
        
        countBackView.layer.cornerRadius = 10
        countBackView.layer.masksToBounds = true
        
        countBackView.layer.borderWidth = 1
        countBackView.layer.borderColor = UIColor.gray.cgColor
        
//        countLabel.text = "품목 \(foods.count)"
        countLabel.textColor = .gray
        countLabel.font = UIFont.systemFont(ofSize: 11)
        
        sortButton.backgroundColor = .white
        sortButton.layer.cornerRadius = 13
        sortButton.layer.borderWidth = 1
        sortButton.layer.borderColor = UIColor.gray.cgColor
        
        sortButton.setTitle("최근 추가한 순", for: .normal)
//        sortButton.contentHorizontalAlignment = .left
        sortButton.tintColor = .gray
        sortButton.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        
        deadlineColorView.backgroundColor = .fdPurple
        deadlineColorView.layer.cornerRadius = deadlineColorView.frame.width / 2
        deadlineColorView.layer.masksToBounds = true
        
        deadlineLabel.text = "유통기한"
        deadlineLabel.textColor = .black
        deadlineLabel.font = UIFont.systemFont(ofSize: 11)
    }
    
    func setList() {
        foods.append(contentsOf: [
            FoodsDataModel(image: "abc", name: "치즈", firstTag: "#냉장고", secondTag: "#모짜렐라", deadline: "D-5", expiryDay: "D-25"),
            FoodsDataModel(image: "abc", name: "소금", firstTag: "#천일염", secondTag: "#굵은소금", deadline: "D-5", expiryDay: "D-25")
        ])
        
        categorys.append(contentsOf: [
            CategoryDataModel(image: "all", category: "All"),
            CategoryDataModel(image: "orange", category: "과일/채소"),
            CategoryDataModel(image: "seasoning", category: "정육"),
            CategoryDataModel(image: "crab", category: "수산"),
            CategoryDataModel(image: "egg", category: "유제품"),
            CategoryDataModel(image: "seasoning", category: "양념"),
            CategoryDataModel(image: "cookie", category: "간식")
        ])
    }
    
    func registerXib() {
        let cvcNib = UINib(nibName: CategoryCVC.identifier, bundle: nil)
        categoryCollectionView.register(cvcNib, forCellWithReuseIdentifier: CategoryCVC.identifier)
        
        let tvcNib = UINib(nibName: FoodsTVC.identifier, bundle: nil)
        listTableView.register(tvcNib, forCellReuseIdentifier: FoodsTVC.identifier)
    }
    
    func setTableView() {
        listTableView.delegate = self
        listTableView.dataSource = self
        
        listTableView.separatorStyle = .none
        listTableView.showsVerticalScrollIndicator = false
    }
    
    func setCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        categoryCollectionView.showsHorizontalScrollIndicator = false
    }
}

// MARK:- UITableView

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dvc = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(identifier: "DetailVC") as? DetailVC else {
            return
        }
        navigationController?.pushViewController(dvc, animated: true)
    }
}

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FoodsTVC.identifier) as? FoodsTVC else {
            return UITableViewCell()
        }
        cell.initCell(image: foods[indexPath.row].image, name: foods[indexPath.row].name, firstTag: foods[indexPath.row].firstTag, secondTag: foods[indexPath.row].secondTag, deadline: foods[indexPath.row].deadline, expiryDay: foods[indexPath.row].expiryDay)
        cell.selectionStyle = .none
        return cell
    }
}

// MARK:- UICollectionView

extension MainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 30) / 6
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
    }
}

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.identifier, for: indexPath) as? CategoryCVC else {
            return UICollectionViewCell()
        }
        cell.initCell(image: categorys[indexPath.row].image, category: categorys[indexPath.row].category)
        return cell
    }
}
