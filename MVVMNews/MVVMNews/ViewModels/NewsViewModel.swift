//
//  NewsViewModel.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/13.
//

import Foundation

class NewsViewModel {
    var newsList: NewsList

    init(_ newList: NewsList) {
        self.newsList = newList
    }

    var title: String {
        return newsList.articles[0].title
    }

    var description: String {
        return newsList.articles[0].articleDescription
    }
    
//    var news: News
//
//    init(_ news: News) {
//        self.news = news
//    }
//
//    var title: String {
//        return news.title
//    }
//
//    var description: String {
//        return news.articleDescription
//    }
}

