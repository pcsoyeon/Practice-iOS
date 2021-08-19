//
//  ViewController.swift
//  BioID
//
//  Created by soyeon on 2021/08/19.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private var touchIDButton: UIButton = {
        let button = UIButton()
        button.setTitle("TRY TOUCH ID", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    // MARK: - Local Variables
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setAction()
    }
}

extension ViewController {
    func configUI() {
        view.addSubview(touchIDButton)
        touchIDButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        touchIDButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        touchIDButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setAction() {
        let touchIDAction = UIAction { _ in
            print("!!!")
            let context: LAContext = LAContext()
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
                context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "지문 내놔") { wasSuccessful, error in
                    if wasSuccessful {
                        print("WAS A SUCCESSFUL")
                    } else {
                        print("NOT LOGGED IN")
                    }
                }
            }
        }
        touchIDButton.addAction(touchIDAction, for: .touchUpInside)
    }
    
    
}

