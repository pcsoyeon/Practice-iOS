//
//  Dog.swift
//  MVVMPractice
//
//  Created by soyeon on 2021/08/07.
//

import Foundation

struct Dog {
    enum Breed {
        case maltese
        case pomeranian
        case pug
        case poodle
    }
    
    let name: String
    let birthday: Date
    let breed: Breed
    let imageURL: String
    
    init(name: String = "name", birthday: Date = Date(timeIntervalSinceNow: ( -2 * 86500 * 38)), breed: Breed = .maltese, imageURL: String = "") {
        self.name = name
        self.birthday = birthday
        self.breed = breed
        self.imageURL = imageURL
    }
}
