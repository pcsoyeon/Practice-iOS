//
//  TitleTVC.swift
//  TextField-Example
//
//  Created by soyeon on 2021/10/08.
//

import UIKit

class TitleTVC: UITableViewCell {
    static let identifier = "TitleTVC"
    
    // MARK: - UI
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var stackViewBottom: NSLayoutConstraint!
    
    // MARK: - Properties
    
    var expandHandler : ((Bool)->())?
    
    var showCategory : Bool = false
    
    // MARK: - Initializer
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
        
        setTextField()
        setAddTarget()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension TitleTVC {
    func initUI() {
        categoryCollectionView.backgroundColor = .lightGray
        categoryCollectionView.isHidden = true
        
        titleTextField.borderStyle = .none
        titleTextField.placeholder = "글 제목"
        titleTextField.font = UIFont.systemFont(ofSize: 16)
        
        if categoryCollectionView.isHidden {
            stackViewBottom.constant = 20
        }
    }
    
    func setTextField() {
        titleTextField.delegate = self
    }
    
    func setAddTarget() {
        titleTextField.addTarget(self, action: #selector(textFieldDidChange), for:UIControl.Event.editingChanged)
    }
}

extension TitleTVC {
    @objc
    func textFieldDidChange() {
        if titleTextField.text == "아이패드" {
            categoryCollectionView.isHidden = false
            showCategory = !showCategory
            expandHandler?(showCategory)
        }
    }
}

extension TitleTVC: UITextFieldDelegate {
    
}
