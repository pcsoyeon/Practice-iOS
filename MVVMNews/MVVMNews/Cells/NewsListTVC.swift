//
//  NewsListTVC.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/14.
//

import UIKit

class NewsListTVC: UITableViewCell {
    static let identifier = "NewsListTVC"
    
    // MARK: - Properties
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "title"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.lineBreakMode = .byTruncatingTail
        $0.numberOfLines = 3
    }
    
    private lazy var descriptionLabel = UILabel().then {
        $0.text = "description"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 13)
        $0.lineBreakMode = .byTruncatingTail
        $0.numberOfLines = 5
    }

    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension NewsListTVC {
    func configUI() {
        backgroundColor = .white
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    func initCell(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
