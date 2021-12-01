//
//  UserInfo.swift
//  SingletonPattern-Demo
//
//  Created by soyeon on 2021/12/01.
//

import Foundation

class ManDongInfo {
    static let shared = ManDongInfo()
    
    var id: String?
    var password: String?
    var name: String?
}

