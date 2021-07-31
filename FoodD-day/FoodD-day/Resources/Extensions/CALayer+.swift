//
//  CALayer+.swift
//  FoodD-day
//
//  Created by soyeon on 2021/08/01.
//

import Foundation
import UIKit

extension CALayer {
    func applyShadow(
      color: UIColor = .gray,
        alpha: Float = 0.2,
      x: CGFloat = 0,
      y: CGFloat = 2,
      blur: CGFloat = 15,
      spread: CGFloat = 0) {
      
      masksToBounds = false
      shadowColor = color.cgColor
      shadowOpacity = alpha
      shadowOffset = CGSize(width: x, height: y)
      shadowRadius = blur / 2.0
      if spread == 0 {
        shadowPath = nil
      } else {
        let dx = -spread
        let rect = bounds.insetBy(dx: dx, dy: dx)
        shadowPath = UIBezierPath(rect: rect).cgPath
      }
    }
}
