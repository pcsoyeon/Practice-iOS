//
//  UIView+.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/15.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
