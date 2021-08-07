//
//  ViewController.swift
//  MVVMPractice
//
//  Created by soyeon on 2021/08/07.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Dog
        let NewDog = Dog(name: "포메라니안", birthday: Date(), breed: .pomeranian, imageURL: "")

        // View
        let dogView = DogView()
    
        let viewModel = DogViewModel()
        viewModel.updateData(dog: NewDog)
        viewModel.configUI(dogView)
        
        self.view.addSubview(dogView)
        
        // layout
        dogView.translatesAutoresizingMaskIntoConstraints = false
        dogView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 135).isActive = true
        dogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dogView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        dogView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
    }
}

