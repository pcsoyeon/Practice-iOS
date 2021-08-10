//
//  ViewController.swift
//  MVVMBinding
//
//  Created by soyeon on 2021/08/10.
//

import UIKit

/// MVVM Pattern의 규칙
/// 1. View는 ViewModel을 갖고 ViewModel은 Model을 갖는다.
/// 2. ViewModel은 입출력을 처리하고 UI가 요구하는 로직을 처리한다.
/// 3. ViewModel은 UI를 수정할 수 없다.
/// 이때, ViewModel과 ViewController는 서로의 데이터 변경을 알려줄 수 있는 방법이 필요 -> 이것이 DataBinding
///

// MARK: - Obserable
class Observable<T> {
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
}

// MARK: - Model
struct User: Codable {
    let name: String
}

// MARK: - View Models
struct UserListViewModel {
    var users: Observable<[UserTableViewCellViewModel]> = Observable([])
}

struct UserTableViewCellViewModel {
    let name: String
}

// MARK: - Controller
class ViewController: UIViewController, UITableViewDataSource {
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    private var viewModel = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        
        viewModel.users.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        fetchData()
    }
    
    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.users.value?[indexPath.row].name
        return cell
    }

    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let userModels = try JSONDecoder().decode([User].self, from: data)
                
                self.viewModel.users.value = userModels.compactMap({
                    UserTableViewCellViewModel(name: $0.name)
                })
            }
            catch {
                
            }
        }
        task.resume()
    }

}

