//
//  NewsRequest.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/16.
//

import Foundation

struct NewsRequest {
    var country: String
    var apiKey: String
    
    init(_ country: String, _ apiKey: String, _keyword: String) {
        self.country = country
        self.apiKey = apiKey
    }
}
