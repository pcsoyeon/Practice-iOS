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
    
    private lazy var newsListTableView = UITableView().then {
        $0.register(NewsListTVC.self, forCellReuseIdentifier: NewsListTVC.identifier)
    }
    
    private var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchBar.placeholder = "Try Search"
        searchController.searchBar.searchBarStyle = .minimal
        searchController.definesPresentationContext = true
        
        return searchController
    }()
    
    // MARK: - Local Variables
    
    private var newsListVM: NewsListViewModel!
    private let authProvider = MoyaProvider<NewsService>()
    
    private var keyword = String()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        
        setNavigation()
        setSearchController()
        setTableView()
        
        getTopNews()
    }
}

// MARK: - Custom Methods

extension NewsListVC {
    func configUI() {
        view.backgroundColor = .white
        
        view.addSubviews([newsListTableView])
        
        newsListTableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "뉴스"
        navigationItem.searchController = searchController
    }
    
    func setSearchController() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
    }
    
    func setTableView() {
        newsListTableView.delegate = self
        newsListTableView.dataSource = self
        
        newsListTableView.rowHeight = UITableView.automaticDimension
        newsListTableView.estimatedRowHeight = 300
        newsListTableView.separatorStyle = .none
    }
}

extension NewsListVC: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text?.lowercased() else { return }
        keyword = text
        getEveryNews(keyword: keyword)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        getTopNews()
    }
}

extension NewsListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = NewsVC()
        dvc.newsVM = newsListVM.articleAtIndex(indexPath.row)
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
    
    func getTopNews() {
        let param: NewsRequest = NewsRequest.init("us", GeneralAPI.apiKey, _keyword: "")
        
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
    
    func getEveryNews(keyword: String) {
        authProvider.request(.everything(keyword: keyword)) { response in
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
