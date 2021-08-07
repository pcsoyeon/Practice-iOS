//
//  DogViewModel.swift
//  MVVMPractice
//
//  Created by soyeon on 2021/08/07.
//

import Foundation

class DogViewModel {
    var dog: Dog
    let calendar: Calendar
    
    init() {
        self.dog = Dog()
        self.calendar = Calendar(identifier: .gregorian)
    }
    
    var name: String {
        return dog.name
    }
    
    var imageURL: String {
        return dog.imageURL
    }
    
    var ageText: String {
        let today = calendar.startOfDay(for: Date())
        let birthday = calendar.startOfDay(for: dog.birthday)
        let components = calendar.dateComponents([.year], from: birthday, to: today)
        let age = components.year == nil ? 0 : components.year!
        return "\(age) years old"
    }
    
    var adoptionFeeText: String {
        switch dog.breed {
        case .maltese:
            return "20만원"
        case .pomeranian:
            return "50만원"
        case .poodle:
            return "60만원"
        case .pug:
            return "40만원"
        }
    }
}

extension DogViewModel {
    func configUI(_ view: DogView) {
        view.nameLabel.text = name
        view.ageLabel.text = ageText
        view.adoptionFeeLabel.text = adoptionFeeText
        view.imageURL = imageURL
    }
    
    func updateData(dog: Dog) {
        self.dog = dog
    }
}
