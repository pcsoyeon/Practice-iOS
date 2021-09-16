//
//  UIStackView+Extension.swift
//  CustomCalendar
//
//  Created by soyeon on 2021/09/17.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
