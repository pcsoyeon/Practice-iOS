//
//  ViewController.swift
//  MainViewSample
//
//  Created by soyeon on 2021/07/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var mainTableView: UITableView!
    
    // MARK: View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setMainTableView()
        registerNib()
    }
    
}

// MARK: - Custom Methods

extension ViewController {
    func setUI() {
        headerView.backgroundColor = .systemGray6
    }
    
    func setMainTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    func registerNib() {
        let firstNib = UINib(nibName: FirstTVC.identifier, bundle: nil)
        mainTableView.register(firstNib, forCellReuseIdentifier: FirstTVC.identifier)
    }
}

// MARK: - UITableView Delegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 387
        case 1,2:
            return 1585
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstTVC.identifier) as? FirstTVC else {
                return UITableViewCell()
            }
            cell.contentView.backgroundColor = .systemRed
            return cell
        case 1:
            return UITableViewCell()
        case 2:
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    
}
