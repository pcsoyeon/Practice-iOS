//
//  ViewController.swift
//  Lottie-Demo
//
//  Created by soyeon on 2021/10/01.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = AnimationView(name: "test")
        
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300) // 애니메이션뷰의 크기 설정
        animationView.center = self.view.center // 애니메이션뷰의 위치설정
        animationView.contentMode = .scaleAspectFit // 애니메이션뷰의 콘텐트모드 설정
        
        view.addSubview(animationView) // 애니메이션뷰를 메인뷰에 추가
        
        animationView.play() // 애니메이션뷰 실행
    }


}

