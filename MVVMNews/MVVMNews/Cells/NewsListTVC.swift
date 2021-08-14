//
//  NewsListTVC.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/14.
//

import UIKit
import Kingfisher

class NewsListTVC: UITableViewCell {
    static let identifier = "NewsListTVC"
    
    // MARK: - Properties
    
    private lazy var newsImageView = UIImageView().then {
        $0.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
    }
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImageView.image = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension NewsListTVC {
    func configUI() {
        backgroundColor = .white
        
        contentView.addSubview(newsImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        newsImageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(newsImageView.snp.trailing).offset(10)
            make.trailing.top.equalToSuperview().inset(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(newsImageView.snp.trailing).offset(10)
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.trailing.bottom.equalToSuperview().inset(20)
        }
    }
    
    func initCell(imageURL: String, title: String, description: String) {
//        let url = URL(string: imageURL)
//        let data = try? Data(contentsOf: url!)
//        self.newsImageView.image = UIImage(data: data!)
//
//
//        DispatchQueue.global().async {
//            let data = try? Data(contentsOf: url!)
//            DispatchQueue.main.async {
//                self.newsImageView.image = UIImage(data: data!)
//            }
//        }
        
        newsImageView.kf.setImage(with: URL(string: imageURL))
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
