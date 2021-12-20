//
//  TextFieldTVC.swift
//  EditableTableView
//
//  Created by soyeon on 2021/12/20.
//

import UIKit

class TextFieldTVC: UITableViewCell {
    static let identifier = "TextFieldTVC"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .systemGray6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
