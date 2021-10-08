//
//  ViewController.swift
//  TextField-Example
//
//  Created by soyeon on 2021/10/08.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var categoryButton: UIButton!
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var priceButton: UIButton!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setTextField()
    }
}

extension ViewController {
    func configUI() {
        self.title = "중고거래 글쓰기"
        
        titleTextField.borderStyle = .none
        titleTextField.placeholder = "글 제목"
        titleTextField.font = UIFont.systemFont(ofSize: 16)
        
        priceTextField.borderStyle = .none
        priceTextField.placeholder = "가격 (선택사항)"
        priceTextField.font = UIFont.systemFont(ofSize: 16)
        priceTextField.keyboardType = .numberPad
        
        priceButton.isEnabled = false
        priceButton.setTitle("가격제안 받기", for: .normal)
        priceButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        descriptionTextView.text = "구매 일자, 브랜드, 모델명, 사용감, 전자파 인증번호\n등 물품에 대한 자세한 정보를 작성하면 판매확률이\n올라가요!"
        descriptionTextView.textColor = .lightGray
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        descriptionTextView.font = UIFont.systemFont(ofSize: 16)
    }
    
    func setTextField() {
        titleTextField.delegate = self
        priceTextField.delegate = self
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == priceTextField {
            let text = textField.text!
            let newLength = text.count + string.count
            return newLength <= 9
        }
        
        return true
    }
}

extension ViewController: UITextViewDelegate {
    
}
