//
//  ViewController.swift
//  BioID
//
//  Created by soyeon on 2021/08/19.
//

import UIKit
import LocalAuthentication

enum BiometryType {
    case faceId
    case touchId
    case none
}

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private var loginButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private var touchIDButton: UIButton = {
        let button = UIButton()
        button.setTitle("TRY TOUCH ID", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private var faceIDButton: UIButton = {
        let button = UIButton()
        button.setTitle("TRY FACE ID", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    // MARK: - Local Variables
    
    let authContext: LAContext = LAContext()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        configUI()
//        setAction()
        
        // MARK: - 로그인 버튼 (터치+페이스)
        view.addSubview(loginButton)
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.isHidden = !self.canEvaluatePolicy()
        
        let type = self.getBiometryType()
        if type == .faceId {
            loginButton.setImage(UIImage(systemName: "faceid"), for: .normal)
        }
        else if type == .touchId {
            loginButton.setImage(UIImage(systemName: "touchid"), for: .normal)
        } else {
            loginButton.isHidden = true
        }
        
        let loginAction = UIAction { _ in
            self.authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "인증해야지") { (success, error) in
                print("인증결과", success, error as Any)
            }
        }
        loginButton.addAction(loginAction, for: .touchUpInside)
    }
}

extension ViewController {
    func configUI() {
        view.addSubview(touchIDButton)
        view.addSubview(faceIDButton)
        
        touchIDButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        touchIDButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        touchIDButton.translatesAutoresizingMaskIntoConstraints = false
        
        faceIDButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        faceIDButton.topAnchor.constraint(equalTo: touchIDButton.bottomAnchor, constant: 10).isActive = true
        faceIDButton.translatesAutoresizingMaskIntoConstraints = false
        
        touchIDButton.isHidden = !canEvaluatePolicy()
        faceIDButton.isHidden = !canEvaluatePolicy()
    }
    
    func setAction() {
        let touchIDAction = UIAction { _ in
            // password 요구 없이 실패
            if self.authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
                self.authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "🔒") { wasSuccessful, error in
                    if wasSuccessful {
                        print("😺 성공")
                    } else {
                        print("🙀 실패")
                    }
                }
            }
            
            // 3회 이상 -> password 요구
//            if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil) {
//                context.evaluatePolicy(LAPolicy.deviceOwnerAuthentication, localizedReason: "🔒") { wasSuccessful, error in
//                    if wasSuccessful {
//                        print("😺 성공")
//                    } else {
//                        print("🙀 실패")
//                    }
//                }
//            }
        }
        touchIDButton.addAction(touchIDAction, for: .touchUpInside)
        
        let faceIDAction = UIAction { _ in
            if self.authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
                self.authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "🔒") { wasSuccessful, error in
                    if wasSuccessful {
                        print("😺 성공")
                    } else {
                        print("🙀 실패")
                    }
                }
            }
        }
        faceIDButton.addAction(faceIDAction, for: .touchUpInside)
    }
    
    func canEvaluatePolicy() -> Bool {
        let can = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        return can
    }
    
    func getBiometryType() -> BiometryType {
        switch authContext.biometryType {
        case .faceID:
            return .faceId
        case .touchID:
            return .touchId
        default:
            return .none
        }
    }
}

