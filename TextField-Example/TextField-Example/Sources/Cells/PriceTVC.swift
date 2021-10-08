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
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var priceButton: UIButton!
    
    // MARK: - Properties
    
    private var getOffer = true
    
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
        priceTextField.borderStyle = .none
        priceTextField.placeholder = "가격 (선택사항)"
        priceTextField.font = UIFont.systemFont(ofSize: 16)
        priceTextField.keyboardType = .numberPad
        
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "circle")
        configuration.titlePadding = 10
        configuration.imagePadding = 10
        configuration.baseForegroundColor = .lightGray
        configuration.attributedTitle = AttributedString("가격제안 받기", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
        
        priceButton.configuration = configuration
        priceButton.isEnabled = false
        priceButton.addTarget(self, action: #selector(touchUpGetOffer), for: .touchUpInside)
    }
    
    func setTextField() {
        priceTextField.delegate = self
        
        priceTextField.addTarget(self, action: #selector(textFieldDidChange), for:UIControl.Event.editingChanged)
    }
    
    func setToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
           
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(touchUpDone))
                
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        
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
    func touchUpDone() {
        self.contentView.endEditing(true)
    }
    
    @objc
    func textFieldDidChange() {
        priceButton.isEnabled = true
        
        if !priceTextField.hasText {
            priceButton.isEnabled = false
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
            
            priceButton.configuration = configuration
        } else {
            var configuration = UIButton.Configuration.plain()
            configuration.image = UIImage(systemName: "circle")
            configuration.titlePadding = 10
            configuration.imagePadding = 10
            configuration.baseForegroundColor = .lightGray
            configuration.attributedTitle = AttributedString("가격제안 받기", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
            
            priceButton.configuration = configuration
        }
        getOffer.toggle()
        
    }
    
}
