//
//  APIConstants.swift
//  Alamofire-Demo
//
//  Created by soyeon on 2021/11/30.
//

import Foundation

 struct APIConstants {
     static let baseURL = "https://asia-northeast3-naverblog-server.cloudfunctions.net/api"

     static let mainURL = baseURL + "/post/main"
     static let commentURL = baseURL + "/comment"
}

struct APIIndex {
  var index: Index
  
  enum Index {
    case id(Int)
    
    func getIndex() -> String {
      switch self {
      case .id(let index):
        return "/\(index)"
      }
    }
  }
}
