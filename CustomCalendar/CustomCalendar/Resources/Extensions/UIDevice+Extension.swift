//
//  UIDevice+Extension.swift
//  Mascota
//
//  Created by soyeon on 2021/07/06.
//

import UIKit

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
