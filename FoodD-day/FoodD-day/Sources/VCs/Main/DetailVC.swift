//
//  DetailVC.swift
//  FoodD-day
//
//  Created by soyeon on 2021/08/03.
//

import UIKit

class DetailVC: UIViewController {

    // MARK: - UI Components
    
    // 상단 음식 사진
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodView: UIView!
    
    // 음식 상세 뷰
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodCategoryLabel: UILabel!
    @IBOutlet weak var foodDayLabel: UILabel!
    
    // 버튼
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var alarmButton: UIButton!
    
    // 기한
    @IBOutlet weak var deadlineColorView: UIView!
    @IBOutlet weak var deadlineLabel: UILabel!
    
    @IBOutlet weak var expiryColorView: UIView!
    @IBOutlet weak var expiryLabel: UILabel!
    
    // 세부 정보
    @IBOutlet weak var featureLabel: UILabel!
    @IBOutlet weak var firstFeatureLabel: UILabel!
    @IBOutlet weak var secondFeatureLabel: UILabel!
    
    @IBOutlet weak var memoLabel: UILabel!
    @IBOutlet weak var firstMemoLabel: UILabel!
    @IBOutlet weak var secondMemoLabel: UILabel!
    
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var recipeCollectionView: UICollectionView!
    
    // 상단 뒤로 가기 버튼
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: - Local Variables
    
    private var dateFormatter = DateFormatter()
    private var deadlineDay = ""
    private var expiryDay = ""
    
    var food = FoodsDataModel(image: "", name: "", firstTag: "", secondTag: "", deadline: "", expiryDay: "")
    private var recipes = [RecipeDataModel]()
    
    private var isAlarmOn = true
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAction()
        
        setList()
        setDate()
        
        setCollectionView()
    }
}

// MARK: - Custome Methods

extension DetailVC {
    func setUI() {
        foodView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        foodImageView.image = UIImage(named: "cheese")
        foodImageView.contentMode = .scaleAspectFill
        
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 25
        backView.layer.masksToBounds = true
        
        backButton.setTitle("", for: .normal)
        backButton.tintColor = .white
        backButton.setImage(UIImage(named: "back"), for: .normal)
        
        // MARK: - Content UI
        
        foodNameLabel.text = food.name
        foodNameLabel.textColor = .black
        foodNameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        foodCategoryLabel.text = "카테고리"
        foodCategoryLabel.textColor = .gray
        foodCategoryLabel.font = UIFont.systemFont(ofSize: 13)
        
        foodDayLabel.text = "날짜"
        foodDayLabel.textColor = .black
        foodDayLabel.font = UIFont.systemFont(ofSize: 13)
        
        editButton.setTitle("", for: .normal)
        editButton.setImage(UIImage(named: "edit"), for: .normal)
        editButton.tintColor = .black
        
        alarmButton.setTitle("", for: .normal)
        alarmButton.setImage(UIImage(named: "alarm"), for: .normal)
        alarmButton.tintColor = .black
        
        deadlineColorView.backgroundColor = .fdPurple
        deadlineColorView.layer.cornerRadius = deadlineColorView.frame.width / 2
        deadlineColorView.layer.masksToBounds = true

        deadlineLabel.textColor = .black
        deadlineLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        expiryColorView.backgroundColor = .fdYellow
        expiryColorView.layer.cornerRadius = expiryColorView.frame.width / 2
        expiryColorView.layer.masksToBounds = true
        
        expiryLabel.textColor = .black
        expiryLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        featureLabel.text = "특징"
        featureLabel.textColor = .black
        featureLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        firstFeatureLabel.text = "개봉하지 않고 냉장보관 한 우유의 소비기한은 50일!"
        firstFeatureLabel.textColor = .black
        firstFeatureLabel.font = UIFont.systemFont(ofSize: 13)
        
        secondFeatureLabel.text = "우유박스는 물로 헹군 후 종이로 분리수거 해주세요."
        secondFeatureLabel.textColor = .black
        secondFeatureLabel.font = UIFont.systemFont(ofSize: 13)
        
        memoLabel.text = "메모"
        memoLabel.textColor = .black
        memoLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        firstMemoLabel.text = "\(food.firstTag) \(food.secondTag)"
        firstMemoLabel.textColor = .black
        firstMemoLabel.font = UIFont.systemFont(ofSize: 13)
        
        secondMemoLabel.text = "옆집 주민이 어쩌고"
        secondMemoLabel.textColor = .black
        secondMemoLabel.font = UIFont.systemFont(ofSize: 13)
        
        recipeLabel.text = "레시피"
        recipeLabel.textColor = .black
        recipeLabel.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    // MARK: - Action Methods
    
    func setAction() {
        let dismiss = UIAction { _ in
            self.navigationController?.popViewController(animated: true)
        }
        backButton.addAction(dismiss, for: .touchUpInside)
        
        let edit = UIAction { _ in
            print("📝 메모 수정하기")
        }
        editButton.addAction(edit, for: .touchUpInside)
        
        let alarm = UIAction { _ in
            if self.isAlarmOn {
                self.alarmButton.setImage(UIImage(named: "alarmOff"), for: .normal)
                self.isAlarmOn = false
            } else {
                self.alarmButton.setImage(UIImage(named: "alarm"), for: .normal)
                self.isAlarmOn = true
            }
        }
        alarmButton.addAction(alarm, for: .touchUpInside)
    }
    
    // MARK: - Date
    func setDate() {
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        let currentDate = dateFormatter.string(from: Date())
        
        foodDayLabel.text = currentDate
        
        deadlineDay = currentDate
        deadlineLabel.text = "유통기한  |  \(deadlineDay)"
        
        let expiryDate = Date(timeInterval: 60*60*24*30, since: Date())
        expiryDay = dateFormatter.string(from: expiryDate)
        expiryLabel.text = "소비기한  |  \(expiryDay)"
    }
    
    func setList() {
        recipes.append(contentsOf: [
            RecipeDataModel(food: "애플 파이", firstIngredient: "우유.버터.설탕.레몬즙", secondIngredient: "사과.강력분.시나몬스틱"),
            RecipeDataModel(food: "단호박 케이크", firstIngredient: "우유.버터.설탕", secondIngredient: "단호박.강력분.시나몬스틱")
        ])
    }
}

// MARK: - CollectionView

extension DetailVC {
    func setCollectionView() {
        let nib = UINib(nibName: RecipeCVC.identifier, bundle: nil)
        recipeCollectionView.register(nib, forCellWithReuseIdentifier: RecipeCVC.identifier)
        
        recipeCollectionView.delegate = self
        recipeCollectionView.dataSource = self
        
        recipeCollectionView.isScrollEnabled = false
    }
}

extension DetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 17 - 60) / 2
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 17
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }
}

extension DetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCVC.identifier, for: indexPath) as? RecipeCVC else {
            return UICollectionViewCell()
        }
        cell.initCell(food: recipes[indexPath.row].food, first: recipes[indexPath.row].firstIngredient, second: recipes[indexPath.row].secondIngredient)
        return cell
    }
}


