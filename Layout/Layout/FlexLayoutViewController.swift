//
//  FlexLayoutViewController.swift
//  Layout
//
//  Created by soyeon on 2022/02/04.
//

import UIKit

import FlexLayout
import PinLayout

final class FlexLayoutViewController: UIViewController {
    
    // MARK: - Properties
    
    let rootFlexContainer: UIView = UIView()
    
    private var fLabel1: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .systemPink
        label.text = "Label1"
        return label
    }()
    
    private var fLabel2: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .white
        label.text = "Label2"
        return label
    }()
    
    private var fLabel3: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .systemMint
        label.text = "Label3"
        return label
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.rootFlexContainer.pin.top(100).bottom(10).left(10).right(10) // 1)
        self.rootFlexContainer.flex.layout() // 2)
    }

    // MARK: - InitUI
    
    private func configUI() {
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        view.addSubview(rootFlexContainer)
        
//        rootFlexContainer.flex.define {
//            $0.addItem(fLabel1).grow(1)
//            $0.addItem(fLabel2).grow(2)
//            $0.addItem(fLabel3).grow(3)
//        }
        
        rootFlexContainer.flex.direction(.column).define { flex in
            [fLabel1, fLabel2, fLabel3].forEach {
                flex.addItem($0)
            }
        }
        
//        self.rootFlexContainer.pin.all() // 1)
//        self.rootFlexContainer.flex.layout() // 2)
    }
    
    // MARK: - Custom Method
}
