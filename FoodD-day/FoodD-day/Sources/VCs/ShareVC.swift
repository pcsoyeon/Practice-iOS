//
//  ShareVC.swift
//  FoodD-day
//
//  Created by soyeon on 2021/07/31.
//

import UIKit

class ShareVC: UIViewController {
    
    // MARK: - UI Components
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var guideLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var friendsTableView: UITableView!
    
    // MARK: - Local Variables
    
    private var friends = [FriendsDataModel]()

    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAction()
        
        setList()
        registerXib()
        setTableView()
    }
}

// MARK: - UI
extension ShareVC {
    func setUI() {
        backView.backgroundColor = .fdMainGreen
        
        backButton.tintColor = .white
        
        titleLabel.text = "공유하기"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        
        topView.backgroundColor = .white
        topView.layer.cornerRadius = 15
        topView.layer.masksToBounds = true
        topView.layer.applyShadow()
        
        guideLabel.text = "내 냉장고를 공유하여 구성원들끼리\n냉장고 상황을 파악하세요."
        guideLabel.textColor = UIColor.gray
        guideLabel.font = UIFont.systemFont(ofSize: 15)
        guideLabel.numberOfLines = 2
        guideLabel.textAlignment = .center
        
        shareButton.backgroundColor = UIColor.fdMainGreen
        shareButton.layer.cornerRadius = 15
        shareButton.layer.masksToBounds = true
        
        shareButton.setTitle("내 냉장고 공유", for: .normal)
        shareButton.setTitleColor(.white, for: .normal)
        shareButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    func setList() {
        friends.append(contentsOf: [
            FriendsDataModel(icon: "pAlmond", name: "아몬드", relaiton: "오빠"),
            FriendsDataModel(icon: "pGranola", name: "그래놀라", relaiton: "언니")
        ])
    }
    
    func registerXib() {
        let nib = UINib(nibName: FriendsTVC.identifier, bundle: nil)
        friendsTableView.register(nib, forCellReuseIdentifier: FriendsTVC.identifier)
    }
    
    func setTableView() {
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        
        friendsTableView.separatorStyle = .none
        friendsTableView.backgroundColor = .white
        
        friendsTableView.layer.cornerRadius = 15
        friendsTableView.layer.masksToBounds = true
        friendsTableView.layer.applyShadow()
    }
}

// MARK: - Action

extension ShareVC {
    func setAction() {
        let popToMypage = UIAction { _ in
            self.navigationController?.popViewController(animated: true)
            NotificationCenter.default.post(name: NSNotification.Name("shareCounts"), object: self.friends.count)
        }
        backButton.addAction(popToMypage, for: .touchUpInside)
    }
}

// MARK: - UITableView Delegate

extension ShareVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "구성원 (\(friends.count))"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.white
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.gray
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // MARK: - FIX ME: 스크롤 시 테이블 헤더 고정
    }
}

// MARK: - UITableView DataSource

extension ShareVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTVC.identifier) as? FriendsTVC else {
            return UITableViewCell()
        }
        cell.initCell(icon:friends[indexPath.row].icon, name: friends[indexPath.row].name, relation: friends[indexPath.row].relaiton)
        return cell
    }
}
