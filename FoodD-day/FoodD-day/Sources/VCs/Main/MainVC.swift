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
    
    @IBOutlet weak var guideCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var firstIndicator: UIView!
    @IBOutlet weak var secondIndicator: UIView!
    @IBOutlet weak var thirdIndicator: UIView!
    
    @IBOutlet weak var countBackView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var sortButton: UIButton!
    
    @IBOutlet weak var deadlineColorView: UIView!
    @IBOutlet weak var deadlineLabel: UILabel!
    
    @IBOutlet weak var expiryColorView: UIView!
    @IBOutlet weak var expiryDayLabel:
        UILabel!
    
    @IBOutlet weak var listTableView: UITableView!
    
    // MARK:- Local Variables
    
    private var guides = [GuideDataModel]()
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
        
        firstIndicator.layer.cornerRadius = firstIndicator.frame.width / 2
        firstIndicator.backgroundColor = .white
        
        secondIndicator.layer.cornerRadius = secondIndicator.frame.width / 2
        secondIndicator.backgroundColor = .fdMainGreen
        secondIndicator.layer.borderWidth = 1
        secondIndicator.layer.borderColor = UIColor.white.cgColor
        
        thirdIndicator.layer.cornerRadius = thirdIndicator.frame.width / 2
        thirdIndicator.backgroundColor = .fdMainGreen
        thirdIndicator.layer.borderWidth = 1
        thirdIndicator.layer.borderColor = UIColor.white.cgColor
        
        countBackView.layer.cornerRadius = 10
        countBackView.layer.masksToBounds = true
        
        countBackView.layer.borderWidth = 1
        countBackView.layer.borderColor = UIColor.gray.cgColor
        
        countLabel.textColor = .gray
        countLabel.font = UIFont.systemFont(ofSize: 11)
        
        sortButton.backgroundColor = .white
        sortButton.layer.cornerRadius = 13
        sortButton.layer.borderWidth = 1
        sortButton.layer.borderColor = UIColor.gray.cgColor
        
        sortButton.setTitle("최근 추가한 순", for: .normal)
        sortButton.tintColor = .gray
        sortButton.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        
        deadlineColorView.backgroundColor = .fdPurple
        deadlineColorView.layer.cornerRadius = deadlineColorView.frame.width / 2
        deadlineColorView.layer.masksToBounds = true
        
        deadlineLabel.text = "유통기한"
        deadlineLabel.textColor = .black
        deadlineLabel.font = UIFont.systemFont(ofSize: 11)
        
        expiryColorView.backgroundColor = .fdYellow
        expiryColorView.layer.cornerRadius = deadlineColorView.frame.width / 2
        expiryColorView.layer.masksToBounds = true
        
        expiryDayLabel.text = "소비기한"
        expiryDayLabel.textColor = .black
        expiryDayLabel.font = UIFont.systemFont(ofSize: 11)
    }
    
    func setList() {
        guides.append(contentsOf: [
            GuideDataModel(guide: "안녕하세요. 그래놀라님,", guideImage: "pGranola"),
            GuideDataModel(guide: "안녕하세요. 호두님,", guideImage: "pWalnut"),
            GuideDataModel(guide: "안녕하세요. 아몬드님,", guideImage: "pAlmond")
        ])
        
        foods.append(contentsOf: [
            FoodsDataModel(image: "cheese", name: "치즈", firstTag: "#냉장고", secondTag: "#모짜렐라", deadline: "D-5", expiryDay: "D-25"),
            FoodsDataModel(image: "cheese", name: "소금", firstTag: "#천일염", secondTag: "#굵은소금", deadline: "D-10", expiryDay: "D-25")
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
        let guideNib = UINib(nibName: GuideCVC.identifier, bundle: nil)
        guideCollectionView.register(guideNib, forCellWithReuseIdentifier: GuideCVC.identifier)
        
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
        guideCollectionView.delegate = self
        guideCollectionView.dataSource = self
        
        guideCollectionView.backgroundColor = .fdMainGreen
        guideCollectionView.showsHorizontalScrollIndicator = false
        guideCollectionView.contentInsetAdjustmentBehavior = .never
        guideCollectionView.decelerationRate = .fast
        
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
        dvc.food = foods[indexPath.row]
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
        if collectionView == guideCollectionView {
            return 0
        } else {
            return 15
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        if collectionView == guideCollectionView {
            width = collectionView.frame.width
            height = collectionView.frame.height
        } else {
            width = (collectionView.frame.width - 30) / 6
            height = collectionView.frame.height
        }
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == guideCollectionView {
            return .zero
        } else {
            return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            categoryCollectionView.scrollToItem(at: IndexPath(item: indexPath.row, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView == guideCollectionView {
            let spacing = topView.frame.width
            var offset = targetContentOffset.pointee
            let index = round((offset.x + scrollView.contentInset.left) / spacing)

            offset = CGPoint(x: index * spacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
            targetContentOffset.pointee = offset

            if index == 0 {
                firstIndicator.backgroundColor = .white

                secondIndicator.backgroundColor = .fdMainGreen
                secondIndicator.layer.borderWidth = 1
                secondIndicator.layer.borderColor = UIColor.white.cgColor

                thirdIndicator.backgroundColor = .fdMainGreen
                thirdIndicator.layer.borderWidth = 1
                thirdIndicator.layer.borderColor = UIColor.white.cgColor

            } else if index == 1 {
                firstIndicator.backgroundColor = .fdMainGreen
                firstIndicator.layer.borderWidth = 1
                firstIndicator.layer.borderColor = UIColor.white.cgColor

                secondIndicator.backgroundColor = .white

                thirdIndicator.backgroundColor = .fdMainGreen
                thirdIndicator.layer.borderWidth = 1
                thirdIndicator.layer.borderColor = UIColor.white.cgColor
            } else {
                firstIndicator.backgroundColor = .fdMainGreen
                firstIndicator.layer.borderWidth = 1
                firstIndicator.layer.borderColor = UIColor.white.cgColor

                secondIndicator.backgroundColor = .fdMainGreen
                secondIndicator.layer.borderWidth = 1
                secondIndicator.layer.borderColor = UIColor.white.cgColor

                thirdIndicator.backgroundColor = .white
            }
        }
    }
}

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == guideCollectionView {
            return guides.count
        }
        return categorys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == guideCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GuideCVC.identifier, for: indexPath) as? GuideCVC else {
                return UICollectionViewCell()
            }
            cell.initCell(guide: guides[indexPath.row].guide, image: guides[indexPath.row].guideImage)
            return cell
        }
        
        if collectionView == categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.identifier, for: indexPath) as? CategoryCVC else {
                return UICollectionViewCell()
            }
            if indexPath.row == 0 {
                cell.isSelected = true
                // MARK: - FIX ME
                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .init())
            } else {
                cell.isSelected = false
            }
            cell.initCell(image: categorys[indexPath.row].image, category: categorys[indexPath.row].category)
            return cell
        }
        
        return UICollectionViewCell()
    }
}
