//
//  NewsVC.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/15.
//

import UIKit
import SnapKit
import Then

class NewsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
}

extension NewsVC {
    func configUI() {
        view.backgroundColor = .white
    }
}
