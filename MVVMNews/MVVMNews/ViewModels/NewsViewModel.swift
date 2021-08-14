//
//  NewsViewModel.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/13.
//

import Foundation

struct NewsListViewModel {
    var newsList: NewsList

    init(_ newList: NewsList) {
        self.newsList = newList
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.newsList.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> NewsViewModel {
        let article = self.newsList.articles[index]
        return NewsViewModel(article)
    }
}

struct NewsViewModel {
    var news: News
    
    init(_ news: News) {
        self.news = news
    }
    
    var title: String {
        return news.title
    }

    var description: String {
        return news.articleDescription
    }
    
    var image: String {
        return news.urlToImage
    }
}

