//
//  MVVMViewController.swift
//  MVVMBinding
//
//  Created by soyeon on 2021/08/10.
//

import UIKit

/// MVVM 패턴
/// Model - 데이터 모델
/// ViewModel - 갱신된 데이터를 뷰에 보여질 수 있도록 로직을 담당
/// View - 뷰에 보여주는 역할 (ViewController)

// MARK: - Model


// MARK: - Data Bind

class Bind<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}

// MARK: - View Model

class MVVMExampleViewModel {
    var helloText = Bind("")
    
    func userTriggeredSayHelloButton() {
        helloText.value = "🐰 안녕"
    }
}


// MARK: - View

class MVVMViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    
    private var viewModel = MVVMExampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.helloText.bind({ (helloText) in
            DispatchQueue.main.async {
                self.helloLabel.text = helloText
            }
        })
    }
    
    @IBAction func sayHelloButtonPressed(_ sender: UIButton) {
        viewModel.userTriggeredSayHelloButton()
    }
}
