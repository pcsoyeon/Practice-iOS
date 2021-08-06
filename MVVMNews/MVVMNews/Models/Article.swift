//
//  Article.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/06.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
