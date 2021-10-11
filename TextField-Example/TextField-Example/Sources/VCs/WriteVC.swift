//
//  WriteVC.swift
//  TextField-Example
//
//  Created by soyeon on 2021/10/08.
//

import UIKit

class WriteVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var writeTableView: UITableView!
    
    // MARK: - Properties
    
    var selectedCellPath: [IndexPath] = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setTableView()
    }
}

extension WriteVC {
    func configUI() {
        title = "중고거래 글쓰기"
    }
    
    func setTableView() {
        writeTableView.delegate = self
        writeTableView.dataSource = self
        
        let titleNib = UINib(nibName: TitleTVC.identifier, bundle: nil)
        writeTableView.register(titleNib, forCellReuseIdentifier: TitleTVC.identifier)
        
        let priceNib = UINib(nibName: PriceTVC.identifier, bundle: nil)
        writeTableView.register(priceNib, forCellReuseIdentifier: PriceTVC.identifier)
        
        let categoryNib = UINib(nibName: CategoryTVC.identifier, bundle: nil)
        writeTableView.register(categoryNib, forCellReuseIdentifier: CategoryTVC.identifier)
    }
}

extension WriteVC: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        case 1:
            if !selectedCellPath.isEmpty && selectedCellPath.contains(indexPath) {
                return 280
            }
            return UITableView.automaticDimension
        case 2,3:
            return 80
        case 4:
            return 500
        default:
            return 0
        }
    }
}

extension WriteVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTVC") as? TitleTVC else {
                return UITableViewCell()
            }
            
            cell.expandHandler = { [weak self] (response) in
                if response {
                    self?.selectedCellPath.append(indexPath)
                }
                else{
                    self?.selectedCellPath = self!.selectedCellPath.filter({ (index) -> Bool in
                        return index != indexPath
                    })
                }
                self?.writeTableView.reloadRows(at: self!.selectedCellPath, with: .none)
            }
            
            return cell
        }
        
        if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTVC.identifier) as? CategoryTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        
        if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PriceTVC.identifier) as? PriceTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        
        return UITableViewCell()
    }
}

