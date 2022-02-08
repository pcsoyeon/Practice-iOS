//
//  ViewController.swift
//  Moya-Practice
//
//  Created by soyeon on 2022/02/09.
//

import UIKit

import SnapKit
import Then

import Moya

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private var likeButton = UIButton().then {
        $0.setTitle("하트 누르기", for: .normal)
        $0.setTitleColor(.systemPink, for: .normal)
        $0.addTarget(self, action: #selector(touchUpLikeButton), for: .touchUpInside)
    }
    
    private var likeLabel = UILabel().then {
        $0.text = "서버 응답 메세지"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 15)
    }
    
    private var isLike: Bool = true
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupLayout()
    }
    
    // MARK: - InitUI
    
    private func configUI() {
        view.backgroundColor = .white
        
        likeButton.setTitle(isLike ? "좋아요" : "싫어요", for: .normal)
    }
    
    private func setupLayout() {
        [likeButton, likeLabel].forEach {
            view.addSubview($0)
        }
        
        likeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
        }
        
        likeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(likeLabel.snp.bottom).offset(20)
        }
    }
    
    // MARK: - Custom Method
    
    private func likePost() {
        LikeAPI.shared.likePost(parameter: LikeRequest.init(postId: 1, state: isLike)) { responseData in
            switch responseData {
            case .success(let likeResponse):
                
                guard let response = likeResponse as? GeneralResponse<LikeResponse> else { return }
                
                self.likeLabel.text = response.message
                self.isLike.toggle()
                
            case .requestErr(let message):
                print("requestErr \(message)")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    // MARK: - @objc
    
    @objc func touchUpLikeButton() {
        likePost()
        likeButton.setTitle(isLike ? "좋아요" : "싫어요", for: .normal)
    }
}
