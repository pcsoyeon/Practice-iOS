//
//  PriceTVC.swift
//  TextField-Example
//
//  Created by soyeon on 2021/10/08.
//

import UIKit

class PriceTVC: UITableViewCell {
    static let identifier = "PriceTVC"
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var wonLabel: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var getPriceButton: UIButton!
    
    @IBOutlet weak var shareCategoryButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    // MARK: - Properties
    
    private var getOffer = true
    private var isShare = false
    
    // MARK: - Initializer
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
        setTextField()
        setToolbar()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension PriceTVC {
    func initUI() {
        wonLabel.textColor = .lightGray
        
        priceTextField.borderStyle = .none
        priceTextField.placeholder = "가격 (선택사항)"
        priceTextField.font = UIFont.systemFont(ofSize: 16)
        priceTextField.keyboardType = .numberPad
        
        var getOfferConfig = UIButton.Configuration.plain()
        getOfferConfig.image = UIImage(systemName: "checkmark.circle.fill")
        getOfferConfig.titlePadding = 10
        getOfferConfig.imagePadding = 10
        getOfferConfig.baseForegroundColor = .lightGray
        getOfferConfig.attributedTitle = AttributedString("가격제안 받기", attributes: AttributeContainer([ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
        
        getPriceButton.configuration = getOfferConfig
        getPriceButton.isEnabled = false
        getPriceButton.addTarget(self, action: #selector(touchUpGetOffer), for: .touchUpInside)
        
        var getShareConfig = UIButton.Configuration.plain()
        getShareConfig.image = UIImage(systemName: "circle")
        getShareConfig.titlePadding = 10
        getShareConfig.imagePadding = 10
        getShareConfig.baseForegroundColor = .lightGray
        getShareConfig.attributedTitle = AttributedString("나눔 이벤트 열기", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
        shareButton.configuration = getShareConfig
        shareButton.isHidden = true
        shareButton.addTarget(self, action: #selector(touchUpShare), for: .touchUpInside)
        
        shareCategoryButton.isHidden = true
        shareCategoryButton.addTarget(self, action: #selector(touchUpShareCategory), for: .touchUpInside)
    }
    
    func setTextField() {
        priceTextField.delegate = self
        
        priceTextField.addTarget(self, action: #selector(textFieldDidChange), for:UIControl.Event.editingChanged)
    }
    
    func setToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
           
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(touchUpEdit))
        let filterButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(touchUpFilter))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(touchUpDone))
                
        toolbar.setItems([editButton, filterButton, flexibleSpace, doneButton], animated: false)
        
        priceTextField.inputAccessoryView = toolbar
    }
}

extension PriceTVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == priceTextField {
            let text = textField.text!
            let newLength = text.count + string.count
            return newLength <= 9
        }
        
        return true
    }
}

extension PriceTVC {
    @objc
    func touchUpEdit() {
        self.contentView.endEditing(true)
    }
    
    @objc
    func touchUpFilter() {
        self.contentView.endEditing(true)
    }
    
    @objc
    func touchUpDone() {
        self.contentView.endEditing(true)
    }
    
    @objc
    func textFieldDidChange() {
        
        getPriceButton.isEnabled = true
        
        if !priceTextField.hasText {
            wonLabel.textColor = .lightGray
            getPriceButton.isEnabled = false
            getPriceButton.setTitleColor(.lightGray, for: .normal)
        } else {
            wonLabel.textColor = .black
        }
        
        if priceTextField.text == "0" {
            priceTextField.text = ""
            wonLabel.isHidden = true
            priceTextField.isHidden = true
            shareCategoryButton.isHidden = false
            
            getPriceButton.isHidden = true
            shareButton.isHidden = false
            self.contentView.endEditing(true)
        }
    }
    
    @objc
    func touchUpGetOffer() {
        if !getOffer {
            var configuration = UIButton.Configuration.plain()
            configuration.image = UIImage(systemName: "checkmark.circle.fill")
            configuration.titlePadding = 10
            configuration.imagePadding = 10
            configuration.baseForegroundColor = .lightGray
            configuration.attributedTitle = AttributedString("가격제안 받기", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
            
            getPriceButton.configuration = configuration
        } else {
            var configuration = UIButton.Configuration.plain()
            configuration.image = UIImage(systemName: "circle")
            configuration.titlePadding = 10
            configuration.imagePadding = 10
            configuration.baseForegroundColor = .lightGray
            configuration.attributedTitle = AttributedString("가격제안 받기", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
            
            getPriceButton.configuration = configuration
        }
        getOffer.toggle()
        
    }
    
    @objc
    func touchUpShare() {
        if !isShare {
            var configuration = UIButton.Configuration.plain()
            configuration.image = UIImage(systemName: "checkmark.circle.fill")
            configuration.titlePadding = 10
            configuration.imagePadding = 10
            configuration.baseForegroundColor = .lightGray
            configuration.attributedTitle = AttributedString("나눔 이벤트 열기", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
            
            shareButton.configuration = configuration
        } else {
            var configuration = UIButton.Configuration.plain()
            configuration.image = UIImage(systemName: "circle")
            configuration.titlePadding = 10
            configuration.imagePadding = 10
            configuration.baseForegroundColor = .lightGray
            configuration.attributedTitle = AttributedString("나눔 이벤트 열기", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
            
            shareButton.configuration = configuration
        }
        isShare.toggle()
    }
    
    @objc
    func touchUpShareCategory() {
        shareCategoryButton.isHidden = true
        shareButton.isHidden = true
        
        wonLabel.textColor = .lightGray
        wonLabel.isHidden = false
        priceTextField.isHidden = false
        getPriceButton.isHidden = false
        
        priceTextField.becomeFirstResponder()
    }
    
}
