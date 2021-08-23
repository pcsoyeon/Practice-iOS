//
//  ViewController.swift
//  ShakeGesture
//
//  Created by soyeon on 2021/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        becomeFirstResponder()
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
//            let alert = UIAlertController(title: "Detected Shake", message: "User got mad and shook their phone.", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
//            present(alert, animated: true, completion: nil)
            
            let vc = UIViewController()
            vc.view.backgroundColor = .white
            present(vc, animated: true, completion: nil)
        }
    }

}

