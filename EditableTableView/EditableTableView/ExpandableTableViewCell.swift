//
//  ExpandableTableViewCell.swift
//  EditableTableView
//
//  Created by soyeon on 2022/01/31.
//

import UIKit

class ExpandableTableViewCellContent {
    var expanded: Bool
    
    init() {
        self.expanded = false
    }
}

class ExpandableTableViewCell: UITableViewCell {
    static let identifier = "ExpandableTableViewCell"
    
    // MARK: - Properties
    
    private var dummylabel = UILabel()
    private var dummyImageView = UIImageView()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Up Method
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configUI() {
        backgroundColor = .white
        
        dummylabel.text = "누르면 확장됩니다."
        dummylabel.textColor = .black
        dummylabel.font = .systemFont(ofSize: 16)
        
        dummyImageView.image = UIImage(named: "good")
        dummyImageView.contentMode = .scaleAspectFit
    }
    
    private func setupLayout() {
        [dummylabel, dummyImageView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            dummylabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            dummylabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            dummyImageView.topAnchor.constraint(equalTo: dummylabel.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            dummyImageView.centerXAnchor.constraint(equalTo: dummylabel.safeAreaLayoutGuide.centerXAnchor),
            dummyImageView.widthAnchor.constraint(equalToConstant: 100),
            dummyImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    // MARK: - Custom Method
    
    private func bind() {
        
    }
    
    // MARK:  - Public Method
    
    public func config(isSelected: ExpandableTableViewCellContent) {
        if isSelected.expanded == true {
            dummylabel.text = "다시 누르면 축소됩니다"
            dummyImageView.isHidden = false
            dummyImageView.alpha = 1
            
            dummyImageView.heightAnchor.constraint(equalToConstant: 133).isActive = true
            dummyImageView.layoutIfNeeded()
            
        } else {
            dummylabel.text = "누르면 확장됩니다"
            dummyImageView.alpha = 0
            dummyImageView.isHidden = true
            
            dummyImageView.heightAnchor.constraint(equalToConstant: 0).isActive = true
            dummyImageView.layoutIfNeeded()
        }
    }
}
