//
//  ViewController.swift
//  AutoSizingTextView
//
//  Created by soyeon on 2022/02/01.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Properties
    
    private var autosizingTextView = UITextView()
    
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
        
        autosizingTextView.textColor = .white
        autosizingTextView.backgroundColor = .darkGray
        autosizingTextView.font = UIFont.preferredFont(forTextStyle: .headline)
        autosizingTextView.isScrollEnabled = false
    }
    
    private func setupLayout() {
        view.addSubview(autosizingTextView)
        
        autosizingTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            autosizingTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            autosizingTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            autosizingTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            autosizingTextView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Custom Method
    
    private func bind() {
        autosizingTextView.delegate = self
    }
}


// MARK: - UITextView Delegate

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraints) in
            if constraints.firstAttribute == .height {
                constraints.constant = estimatedSize.height
            }
        }
    }
}
