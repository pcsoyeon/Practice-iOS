//
//  UIView+Extension.swift
//  CustomCalendar
//
//  Created by soyeon on 2021/09/17.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
