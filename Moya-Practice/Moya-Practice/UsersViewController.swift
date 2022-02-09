//
//  UsersViewController.swift
//  Moya-Practice
//
//  Created by soyeon on 2022/02/09.
//

import UIKit

import SnapKit
import Then

import Moya

final class UsersViewController: UIViewController {
    
    // MARK: - Properties
    
    private var totalCountLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 15, weight: .black)
    }
    
    private var userNameLabel1 = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 15)
    }
    
    private var userNameLabel2 = UILabel().then {
        $0.textColor = .systemPink
        $0.font = .systemFont(ofSize: 15)
    }
    
    private var userNameLabel3 = UILabel().then {
        $0.textColor = .systemTeal
        $0.font = .systemFont(ofSize: 15)
    }
    
    private var userAgeLabel1 = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 15)
    }
    
    private var userAgeLabel2 = UILabel().then {
        $0.textColor = .systemPink
        $0.font = .systemFont(ofSize: 15)
    }
    
    private var userAgeLabel3 = UILabel().then {
        $0.textColor = .systemTeal
        $0.font = .systemFont(ofSize: 15)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupLayout()
    }
    
    // MARK: - InitUI
    
    private func configUI() {
        view.backgroundColor = .white
        
        DispatchQueue.main.async {
            guard
                let jsonData = self.load(),
                let userList = try? JSONDecoder().decode(UserResponse.self, from: jsonData)
            else { return }
            
            self.totalCountLabel.text = "\(userList.totalCount)명"
            
            self.userNameLabel1.text = userList.users[0].name
            self.userAgeLabel1.text = "\(userList.users[0].age)"
            
            self.userNameLabel2.text = userList.users[1].name
            self.userAgeLabel2.text = "\(userList.users[1].age)"
            
            self.userNameLabel3.text = userList.users[2].name
            self.userAgeLabel3.text = "\(userList.users[2].age)"
        }
    }
    
    private func setupLayout() {
        [totalCountLabel, userNameLabel1, userAgeLabel1, userNameLabel2, userAgeLabel2, userNameLabel3, userAgeLabel3].forEach {
            view.addSubview($0)
        }
        
        totalCountLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.leading.equalToSuperview().inset(50)
        }
        
        userNameLabel1.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.leading.equalToSuperview().inset(50)
        }
        
        userAgeLabel1.snp.makeConstraints {
            $0.centerY.equalTo(userNameLabel1.snp.centerY)
            $0.leading.equalTo(userNameLabel1.snp.trailing).offset(10)
        }
        
        userNameLabel2.snp.makeConstraints {
            $0.top.equalTo(userNameLabel1.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(50)
        }
        
        userAgeLabel2.snp.makeConstraints {
            $0.centerY.equalTo(userNameLabel2.snp.centerY)
            $0.leading.equalTo(userNameLabel2.snp.trailing).offset(10)
        }
        
        userNameLabel3.snp.makeConstraints {
            $0.top.equalTo(userNameLabel2.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(50)
        }
        
        userAgeLabel3.snp.makeConstraints {
            $0.centerY.equalTo(userNameLabel3.snp.centerY)
            $0.leading.equalTo(userNameLabel3.snp.trailing).offset(10)
        }
    }
    
    // MARK: - Custom Method
    
    func load() -> Data? {
        // 1. 불러올 파일 이름
        let fileNm: String = "User"
        
        // 2. 불러올 파일의 확장자명
        let extensionType = "json"
        
        // 3. 파일 위치
        guard let fileLocation = Bundle.main.url(forResource: fileNm, withExtension: extensionType) else { return nil }
        
        do {
            // 4. 해당 위치의 파일을 Data로 초기화하기
            let data = try Data(contentsOf: fileLocation)
            return data
        } catch {
            // 5. 잘못된 위치나 불가능한 파일 처리 (오늘은 따로 안하기)
            print("파일 로드 실패")
            return nil
        }
    }
}


