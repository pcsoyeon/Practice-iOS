//
//  NewsListTableViewController.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/06.
//

import UIKit

class NewsListTableViewController: UITableViewController {

    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        setTableView()
        
        getAPI()
    }
    
    private func configUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
    }
    
    private func getAPI() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e9b514c39c5f456db8ed4ecb693b0040")!
        APIService().getArticles(url: url) {
            (articles) in
            
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension NewsListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell
        else {fatalError("no matched articleTableViewCell identifier")}
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.initCell(title: articleVM.title ?? "", description: articleVM.description ?? "")
        return cell
    }
    
}
