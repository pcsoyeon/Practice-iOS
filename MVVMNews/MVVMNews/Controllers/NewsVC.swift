//
//  NewsVC.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/15.
//

import UIKit
import SnapKit
import Then
import Kingfisher

class NewsVC: UIViewController {

    // MARK: - Properties
    
    var newsVM: NewsViewModel!
    
    private lazy var titleLabel = UILabel().then {
        $0.text = newsVM.title
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.lineBreakMode = .byTruncatingTail
        $0.numberOfLines = 3
    }
    
    private lazy var contentLabel = UILabel().then {
        $0.text = newsVM.content
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.lineBreakMode = .byTruncatingTail
        $0.numberOfLines = 15
    }
    
    private lazy var authorLabel = UILabel().then {
        $0.text = newsVM.author
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 13)
    }
    
    private lazy var dateLabel = UILabel().then {
        $0.text = newsVM.date
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 13)
    }
    
    private lazy var newsImageView = UIImageView().then {
        $0.kf.setImage(with: URL(string: newsVM.image))
        $0.layer.cornerRadius = 15
        $0.layer.masksToBounds = true
        $0.snp.makeConstraints { make in
            make.width.height.equalTo(200)
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
}

// MARK: - Custom Methods

extension NewsVC {
    func configUI() {
        view.backgroundColor = .white
        
        view.addSubviews([titleLabel, contentLabel, authorLabel, dateLabel,newsImageView])
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(100)
        }
        
        newsImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(newsImageView.snp.bottom).offset(15)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(contentLabel.snp.bottom).offset(15)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(authorLabel.snp.bottom).offset(15)
        }
    }
    
    func setNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
}
