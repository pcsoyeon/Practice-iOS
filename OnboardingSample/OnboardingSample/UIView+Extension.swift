//
//  UIView+Extension.swift
//  OnboardingSample
//
//  Created by soyeon on 2021/06/30.
//

import UIKit

extension UIView {
    func setViewShadow(backView: UIView) {
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 10
        backView.layer.borderWidth = 1
        
        layer.masksToBounds = false
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.shadowRadius = 3
    }
}
