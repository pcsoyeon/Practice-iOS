//
//  ViewController.swift
//  Layout
//
//  Created by soyeon on 2022/02/04.
//

import UIKit

import PinLayout

final class ViewController: UIViewController {

    // MARK: - Properties
    
    private var pLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .systemPink
        label.text = "PinLayout을 사용한 Label"
        return label
    }()
    
    private var pLabel2: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .white
        label.text = "PinLayout을 사용한 Label"
        return label
    }()
    
    private var pLabel3: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .systemMint
        label.text = "PinLayout을 사용한 Label"
        return label
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupLayout()
    }
    
    // MARK: - InitUI
    
    private func configUI() {
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        [pLabel, pLabel2, pLabel3].forEach {
            view.addSubview($0)
        }
        
//        pLabel.pin.top(10).bottom(10).left(10).right(10)
//        pLabel.pin.topLeft(10).bottomRight(10)
        
//        pLabel.pin.all(10)
        
//        pLabel.pin.top(10%).left(10%).right(10%).bottom(10%)
        
//        pLabel.pin.top(self.view.pin.safeArea.top)
//        pLabel.pin.left(self.view.pin.safeArea.left)
//        pLabel.pin.right(self.view.pin.safeArea.right)
//        pLabel.pin.horizontally(self.view.pin.safeArea)
        
//        pLabel.pin.top().bottom().hCenter().width(100)
        
//        pLabel.pin.top(20).bottom(20) // The view has a top margin and a bottom margin of 20 pixels
//        pLabel.pin.top().left() // The view is pinned directly on its parent top and left edge
//        pLabel.pin.all() // The view fill completely its parent (horizontally and vertically)
//        pLabel.pin.all(self.view.pin.safeArea) // The view fill completely its parent safeArea
//        pLabel.pin.top(25%).hCenter() // The view is centered horizontally with a top margin of 25%
//        pLabel.pin.left(12).vCenter() // The view is centered vertically
//        pLabel.pin.start(20).end(20) // Support right-to-left languages.
//        pLabel.pin.horizontally(20) // The view is filling its parent width with a left and right margin.
//        pLabel.pin.top().horizontally() // The view is pinned at the top edge of its parent and fill it horizontally.
        
//        pLabel.pin.topRight().size(100)

//        pLabel.pin.topLeft().size(100)
//        pLabel2.pin.top().after(of: pLabel).size(100)
//        pLabel3.pin.left().below(of: pLabel).width(200).height(100)
//        pLabel3.pin.after(of: pLabel).before(of: pLabel2).height(100)
    
        pLabel.pin.topLeft().size(100)
        pLabel2.pin.topRight().size(100)
        pLabel3.pin.horizontallyBetween(pLabel, and: pLabel2).height(100)

    }
    
    // MARK: - Custom Method
}

