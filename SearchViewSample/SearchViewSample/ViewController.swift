//
//  ViewController.swift
//  SearchViewSample
//
//  Created by soyeon on 2021/07/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        registerXib()
        setTableView()
    }
}

// MARK: - Custom Methods

extension ViewController {
    func setUI() {
        view.backgroundColor = .black
    }
    
    func registerXib() {
        let nib = UINib(nibName: StackViewTVC.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StackViewTVC.identifier)
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .systemGray6
    }
}

// MARK: - UITableView Delegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 170
        case 1:
            return 300
        default:
            return UITableView.automaticDimension
        }
    }
}


// MARK: - UITableView DataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StackViewTVC.identifier) as? StackViewTVC else {
                return UITableViewCell()
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}
