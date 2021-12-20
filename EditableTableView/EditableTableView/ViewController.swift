//
//  ViewController.swift
//  EditableTableView
//
//  Created by soyeon on 2021/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets

    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var editTableView: UITableView!
    
    // MARK: - Properties
    
    private var cellArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellArr = ["날짜", "내용"]
        
        editTableView.register(UINib(nibName: DateTVC.identifier, bundle: nil), forCellReuseIdentifier: DateTVC.identifier)
        editTableView.register(UINib(nibName: ContentTVC.identifier, bundle: nil), forCellReuseIdentifier: ContentTVC.identifier)
        editTableView.register(UINib(nibName: TextFieldTVC.identifier, bundle: nil), forCellReuseIdentifier: TextFieldTVC.identifier)
        
        editTableView.estimatedRowHeight = 300
        editTableView.rowHeight = UITableView.automaticDimension
        
        editTableView.delegate = self
        editTableView.dataSource = self
    }

    // MARK: - IB Actions
    
    @IBAction func touchUpEditButton(_ sender: Any) {
        if self.editTableView.isEditing {
            self.editButton.setTitle("Edit", for: .normal)
            self.editTableView.setEditing(false, animated: true)
        } else {
            self.editButton.setTitle("Done", for: .normal)
            self.editTableView.setEditing(true, animated: true)
        }
    }
    
    @IBAction func touchUpPlusButton(_ sender: Any) {
        cellArr.append("내용")
        self.editTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DateTVC.identifier) as? DateTVC else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentTVC.identifier) as? ContentTVC else { return UITableViewCell() }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTVC.identifier) as? TextFieldTVC else { return UITableViewCell() }
            return cell
        }
        
    }
    
    //Edit Mode에서 Row별 모드 지정
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        if indexPath.row == cellArr.count - 1 {
//            return .insert
//        } else {
//            return .delete
//        }
        return .delete
    }
     
    //Edit Mode의 +, - 버튼
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            print("delete")
            self.cellArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else {
            print("insert")
            self.cellArr.insert(self.cellArr[indexPath.row], at: cellArr.count)
            tableView.insertRows(at: [IndexPath(row: cellArr.count-1, section: 0)], with: .automatic)
        }
    }

}

