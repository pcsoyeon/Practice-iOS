//
//  MacoCalendarCell.swift
//  Mascota
//
//  Created by soyeon on 2021/07/13.
//

import UIKit
import FSCalendar
import SnapKit

class MacoCalendarCell: FSCalendarCell {
    static let identifier = "MacoCalendarCell"
     
    private let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let emojiImageView = UIImageView()

    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let circleNumberView: UIView = {
        let view = UIView()
        view.backgroundColor = .macoOrange.withAlphaComponent(0.5)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 17 / 2
        return view
    }()
    
    public let numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .macoWhite
        label.text = "1"
//        label.font = .macoFont(type: .regular, size: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setMacoCalendarCell()
        setNumberLabel(count: -1)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        emojiImageView.image = nil
        numberLabel.text = nil
    }
    
    func setMacoCalendarCell() {
        
        contentView.addSubviews(emojiImageView, circleNumberView)
        
        circleNumberView.addSubviews(numberLabel)
        
        numberLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        if UIDevice.current.hasNotch {
            self.titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(8)
                $0.centerX.equalToSuperview()
            }
            
            emojiImageView.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(8)
                $0.centerX.equalToSuperview()
                $0.width.equalTo(39)
                $0.height.equalTo(30)
            }
            
            circleNumberView.snp.makeConstraints {
                $0.trailing.equalTo(emojiImageView.snp.trailing)
                $0.bottom.equalTo(emojiImageView.snp.bottom).inset(22)
                $0.width.height.equalTo(17)
            }
            
        } else {
            self.titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(5)
                $0.centerX.equalToSuperview()
            }
            
            emojiImageView.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(8)
                $0.centerX.equalToSuperview()
                $0.width.equalTo(26)
                $0.height.equalTo(20)
            }
            
            circleNumberView.snp.makeConstraints {
                $0.trailing.equalTo(emojiImageView.snp.trailing).inset(-5)
                $0.bottom.equalTo(emojiImageView.snp.bottom).inset(12)
                $0.width.height.equalTo(17)
            }
            
        }
    }
    
    public func setNumberLabel(count: Int) {
        if count == -1 {
            emojiImageView.isHidden = true
            circleNumberView.isHidden = true
            emojiImageView.image = UIImage(named: "emoEmpty")
        } else if count == 0 {
            emojiImageView.isHidden = false
            emojiImageView.image = UIImage(named: "emoEmpty")
            circleNumberView.isHidden = true
        } else if count == 1 {
            emojiImageView.isHidden = false
            circleNumberView.isHidden = true
        } else {
            emojiImageView.isHidden = false
            circleNumberView.isHidden = false
            numberLabel.text = String(count)
        }
    }
}
    
