//
//  NewsListVC.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/13.
//

import UIKit
import SnapKit
import Then
import Moya

class NewsListVC: UIViewController {

    // MARK: - Properties
    
    private var newsListTableView = UITableView().then {
        $0.register(NewsListTVC.self, forCellReuseIdentifier: NewsListTVC.identifier)
    }
    
    // MARK: - Local Variables
    
    private var newsListVM: NewsListViewModel!
    private let authProvider = MoyaProvider<NewsService>()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        
        setNavigation()
        setTableView()
        
        getNews()
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = NewsVC()
        navigationController?.pushViewController(dvc, animated: true)
    }
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
        cell.initCell(imageURL: newsListVM.articleAtIndex(indexPath.row).image, title: newsListVM.articleAtIndex(indexPath.row).title, description: newsListVM.articleAtIndex(indexPath.row).description)
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
    
    func getNews() {
        let param: NewsRequest = NewsRequest.init("us", GeneralAPI.apiKey)
        
        authProvider.request(.top(param: param)) { response in
            switch response {
            case .success(let result):
                do {
                    let data = try result.map(NewsList.self)
                    self.newsListVM = NewsListViewModel(data)
                    
                    DispatchQueue.main.async {
                        self.newsListTableView.reloadData()
                    }
                    
                } catch(let err) {
                    print("디코드 에러 - ", err.localizedDescription)
                }
            case .failure(let err):
                print("데이터 에러 - ",err.localizedDescription)
            }
        }
    }
}
