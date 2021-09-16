//
//  UIScreen+.swift
//  CustomCalendar
//
//  Created by soyeon on 2021/09/16.
//

import UIKit

extension UIScreen{
    public var hasNotch: Bool{
        let deviceRatio
            = UIScreen.main.bounds.width / UIScreen.main.bounds.height
        if deviceRatio > 0.5{
            return false
        }
        else{
            return true
        }
    }
}
