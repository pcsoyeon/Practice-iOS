//
//  NewsListVC.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/13.
//

import UIKit

class NewsListVC: UIViewController {

    // MARK: - Properties
    
    var newsVM: NewsViewModel!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        getAPI()
        
        
    }
    
    // MARK: - Network
    
    private func getAPI() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e9b514c39c5f456db8ed4ecb693b0040")!
        APIService().getNews(url: url) {
            (articles) in
            
            if let articles = articles {
                self.newsVM = NewsViewModel(articles)
                dump(self.newsVM)
            }
            
        }
    }
}

extension NewsListVC {
    func configUI() {
        view.backgroundColor = .white
    }
}
