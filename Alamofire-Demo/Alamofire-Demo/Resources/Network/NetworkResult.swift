//
//  NetworkResult.swift
//  Alamofire-Demo
//
//  Created by soyeon on 2021/11/30.
//

import Foundation

enum NetworkResult<T> {
  case success(T)
  case requestErr
  case pathErr
  case serverErr
  case networkFail
}
