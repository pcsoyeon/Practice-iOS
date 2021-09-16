//
//  UIColor+Extension.swift
//  CustomCalendar
//
//  Created by soyeon on 2021/09/17.
//

import UIKit

public extension UIColor {
    class var macoBlack: UIColor { fetchMacoColor(#function) }
    class var macoBlue: UIColor { fetchMacoColor(#function) }
    class var macoDarkGray: UIColor { fetchMacoColor(#function) }
    class var macoGray: UIColor { fetchMacoColor(#function) }
    class var macoIvory: UIColor { fetchMacoColor(#function) }
    class var macoLightGray: UIColor { fetchMacoColor(#function) }
    class var macoOrange: UIColor { fetchMacoColor(#function) }
    class var macoWhite: UIColor { fetchMacoColor(#function) }
    class var macoYellow: UIColor { fetchMacoColor(#function) }
    
    private static func fetchMacoColor(_ name: String) -> UIColor {
        guard let color = UIColor(named: name) else {
            return .black
        }
        return color
    }
}
