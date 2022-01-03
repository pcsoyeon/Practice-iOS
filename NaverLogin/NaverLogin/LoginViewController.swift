//
//  LoginViewController.swift
//  NaverLogin
//
//  Created by soyeon on 2021/12/21.
//

import UIKit

import Alamofire
import NaverThirdPartyLogin

class LoginViewController: UIViewController {
    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.addTarget(self, action: #selector(touchUpLoginButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그아웃", for: .normal)
        button.addTarget(self, action: #selector(touchUpLogoutButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "회원이름"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "별명"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginInstance?.delegate = self
        
        view.backgroundColor = .systemGray6
        layout()
    }
    
    @objc private func touchUpLoginButton(_ sender: UIButton) {
        loginInstance?.requestThirdPartyLogin()
    }
    
    @objc private func touchUpLogoutButton(_ sender: UIButton) {
        loginInstance?.requestDeleteToken()
    }
    
    private func getNaverInfo() {
        guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !isValidAccessToken {
            return
        }
        
        guard let tokenType = loginInstance?.tokenType else { return }
        guard let accessToken = loginInstance?.accessToken else { return }
        
        let urlStr = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: urlStr)!
        
        let authorization = "\(tokenType) \(accessToken)"
        
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        
        req.responseJSON { response in
            guard let result = response.value as? [String: Any] else { return }
            guard let object = result["response"] as? [String: Any] else { return }
            guard let name = object["name"] as? String else { return }
            guard let email = object["email"] as? String else { return }
            guard let id = object["id"] as? String else { return }
            
            print(email)
            
            self.nameLabel.text = "\(name)"
            self.emailLabel.text = "\(email)"
//            self.nicknameLabel.text = "\(id)"
        }
        
      }
    
    private func layout() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(loginButton)
        view.addSubview(logoutButton)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(nicknameLabel)
        
        loginButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -30).isActive = true
        
        logoutButton.leadingAnchor.constraint(equalTo: loginButton.trailingAnchor).isActive = true
        logoutButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        logoutButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -30).isActive = true
        logoutButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 30).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        nicknameLabel.topAnchor
            .constraint(equalTo: emailLabel.bottomAnchor, constant: 30).isActive = true
        nicknameLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        nicknameLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
}

extension LoginViewController: NaverThirdPartyLoginConnectionDelegate {
    // 로그인에 성공한 경우 호출
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("Success login")
        getNaverInfo()
    }
    
    // referesh token
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        loginInstance?.accessToken
    }
    
    // 로그아웃
    func oauth20ConnectionDidFinishDeleteToken() {
        print("log out")
    }
    
    // 모든 error
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("error = \(error.localizedDescription)")
    }
        
}
