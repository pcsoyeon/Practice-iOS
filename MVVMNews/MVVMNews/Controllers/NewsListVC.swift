//
//  NewsListVC.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/13.
//

import UIKit
import SnapKit
import Then

class NewsListVC: UIViewController {

    // MARK: - Properties
    
    private var newsListTableView = UITableView().then {
        $0.register(NewsListTVC.self, forCellReuseIdentifier: NewsListTVC.identifier)
    }
    
    // MARK: - Local Variables
    
    private var newsListVM: NewsListViewModel!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        
        setNavigation()
        setTableView()
        
        getAPI()
    }
}

// MARK: - Custom Methods

extension NewsListVC {
    func configUI() {
        view.backgroundColor = .white
        
        view.addSubview(newsListTableView)
        
        newsListTableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setTableView() {
        newsListTableView.delegate = self
        newsListTableView.dataSource = self
        
        newsListTableView.rowHeight = UITableView.automaticDimension
        newsListTableView.estimatedRowHeight = 300
        newsListTableView.separatorStyle = .none
    }
}

extension NewsListVC: UITableViewDelegate {

}

extension NewsListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.newsListVM == nil ? 0 : self.newsListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsListTVC.identifier) as? NewsListTVC else { return UITableViewCell() }
        cell.initCell(title: newsListVM.articleAtIndex(indexPath.row).title, description: newsListVM.articleAtIndex(indexPath.row).description)
        return cell
    }
}

// MARK: - Network

extension NewsListVC {
    func getAPI() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(GeneralAPI.apiKey)")!
        APIService().getNews(url: url) {
            (articles) in
            if let articles = articles {
                self.newsListVM = NewsListViewModel(articles)
            }
            DispatchQueue.main.async {
                self.newsListTableView.reloadData()
            }
        }
    }
}
