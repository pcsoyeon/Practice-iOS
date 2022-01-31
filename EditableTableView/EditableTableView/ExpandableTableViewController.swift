//
//  ExpandableTableViewController.swift
//  EditableTableView
//
//  Created by soyeon on 2022/01/31.
//

import UIKit

final class ExpandableTableViewController: UIViewController {
    
    // MARK: - Properties
    
    private var expandableTableView = UITableView()
    private var answerFilterDatasource =  ExpandableTableViewCellContent()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupLayout()
        bind()
    }
    
    // MARK: - InitUI
    
    private func configUI() {
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        view.addSubview(expandableTableView)
        
        expandableTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            expandableTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            expandableTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            expandableTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            expandableTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    // MARK: - Custom Method
    
    private func bind() {
        expandableTableView.delegate = self
        expandableTableView.dataSource = self
        
        expandableTableView.separatorStyle = .none
        expandableTableView.separatorInset = .zero
        
        expandableTableView.rowHeight = UITableView.automaticDimension
        
    }
}

// MARK: - UITableView Delegate

extension ExpandableTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = answerFilterDatasource
        
        content.expanded = !content.expanded
        expandableTableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

// MARK: - UITableView DataSource

extension ExpandableTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableTableViewCell.identifier) as? ExpandableTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
    }
}
