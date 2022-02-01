//
//  ChatViewController.swift
//  AutoSizingTextView
//
//  Created by soyeon on 2022/02/01.
//

import UIKit

class ChatViewController: UIViewController {
    
    // MARK: - Properties
    
    private var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var textView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.layer.cornerRadius = 6
        textView.layer.masksToBounds = true
        textView.font = UIFont.preferredFont(forTextStyle: .headline)
        textView.isScrollEnabled = false
        return textView
    }()
    
    private var postButton: UIButton = {
        let button = UIButton()
        button.setTitle("Post", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.addTarget(self, action: #selector(touchUpPostButton), for: .touchUpInside)
        return button
    }()
    
    private var countOfReturn: Int = 0
    
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
        
        [backgroundView, textView, postButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayout() {
        view.addSubview(backgroundView)
        
        [textView, postButton].forEach {
            backgroundView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            textView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 0),
            textView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 0),
            textView.widthAnchor.constraint(equalToConstant: 301)
        ])
        
        NSLayoutConstraint.activate([
            postButton.leadingAnchor.constraint(equalTo: textView.trailingAnchor, constant: 0),
            postButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: 0),
            postButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 0),
            postButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            view.keyboardLayoutGuide.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 10)
        ])
    }
    
    // MARK: - Custom Method
    
    private func bind() {
        textView.delegate = self
    }
    
    // MARK: - @objc
    
    @objc func touchUpPostButton() {
        textView.resignFirstResponder()
    }
}

// MARK: - TextField Delegate

extension ChatViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraints) in
            if constraints.firstAttribute == .height {
                constraints.constant = estimatedSize.height
                
                self.backgroundView.updateConstraints()
            }
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            self.backgroundView.updateConstraints()
        }
        
        return true
    }
}
