//
//  ViewController.swift
//  Alamofire-Demo
//
//  Created by soyeon on 2021/11/30.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        getMainData()
        getCommentData()
    }
    
    
}

extension ViewController {
    func getMainData(){
        MainService.shared.getMainInfo { (response) in
            switch(response) {
            case .success(let mainResponse):
                guard let response = mainResponse as? MainResponseModel else { return }
                if let mainData = response.data {
                    dump(mainData)
                }
            case .requestErr :
                print("requestERR")
            case .pathErr :
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func getCommentData() {
        CommentService.shared.getCommentInfo(id: 1) {
            (networkResult) in
            switch(networkResult) {
            case .success(let commentResponse):
                guard let response = commentResponse as? CommentResponseModel else { return }
                if let commentData = response.data {
                    dump(commentData)
                }
            case .networkFail:
                print("networkFail")
            case .pathErr:
                print("pathErr")
            case .requestErr:
                print("requestErr")
            case .serverErr:
                print("serverErr")
            }
        }
    }
}

