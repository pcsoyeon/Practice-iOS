//
//  StackViewTVC.swift
//  SearchViewSample
//
//  Created by soyeon on 2021/07/04.
//

import UIKit

class StackViewTVC: UITableViewCell {
    static let identifier = "StackViewTVC"
    
    // MARK: - UI Components
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var contentsView: UIView!
    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
        deleteContents()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension StackViewTVC {
    func deleteContents(){
        let deleteAction = UIAction {_ in
            // stack view에 있는 add button을 가져온다.
            guard let addButtonContainerView = self.stackView.arrangedSubviews.last else {
                fatalError("Expected at least one arranged view in the stack view")
            }
            
            // add button 한 칸 앞 index를 가져 온다
            let nextEntryIndex = self.stackView.arrangedSubviews.count - 1
            
            // stackview를 만들어서 안 보이게 처리
            let newEntryView = self.createEntryView()
            newEntryView.isHidden = true
            
            // 만들어진 stack view를 add button앞에다가 추가
            self.stackView.insertArrangedSubview(newEntryView, at: nextEntryIndex)
            
            // 0.25초 동안 추가된 뷰가 보이게 하면서 scrollview의 스크롤 이동
            UIView.animate(withDuration: 0.25) {
                newEntryView.isHidden = false
            }
        }
        deleteButton.addAction(deleteAction, for: .touchUpInside)
    }
    
    private func createEntryView() -> UIView {
        // 현재날 짜는 짧게(M/D/Y) 가져온다
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
        
        // uuid를 가져온다
        let number = NSUUID().uuidString
        
        // 스택뷰를 만들고
        // 각 속성을 아래와 같이 한다.
        // IB에서 하는 것과 같다
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 8
        
        // 날짜르 표시해줄 Label를 만든다
        let dateLabel = UILabel()
        dateLabel.text = date
        dateLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        
        // uuid를 만들 Label을 만든다
        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        
        
        // 이 label의 horizontal contenthugging을 249, compressionResistance 749로 해서 stackview의 남은 공간을 꽉 채우게 한다.
        numberLabel.setContentHuggingPriority(UILayoutPriority.defaultLow - 1.0, for: .horizontal)
        numberLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh - 1.0, for: .horizontal)
        
        // 삭제 버튼을 만든다
        let deleteButton = UIButton(type: .roundedRect)
        deleteButton.setTitle("Delete", for: .normal)
        // 삭제버튼이 눌렸다가 떨어질 때 deleteStackView를 호출하게끔 연결한다.
        deleteButton.addTarget(self, action: #selector(deleteStackView(sender:)), for: .touchUpInside)
        
        //stack 뷰에 차례대로 쌓는다.
        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(numberLabel)
        stack.addArrangedSubview(deleteButton)
        
        return stack
    }
    
    @objc
    func deleteStackView(sender: UIButton) {
        // 클릭 했을 때 버튼의 슈퍼뷰, 즉 버튼이 속해있는 stack view를 가지고 온다
        guard let entryView = sender.superview else { return }
        
        // 0.25동안 그 스택뷰를 안 보이게 하고
        // 완료하면 view 계층구조에서 제거한다
        // view 계층구조에서 제거하면 stackviewe에 arragedSubview에서도 자동적으로 제거됨
        UIView.animate(withDuration: 0.25, animations: {
            entryView.isHidden = true
        }, completion: { _ in
            entryView.removeFromSuperview()
        })
    }
}

extension StackViewTVC {
    func setUI() {
        contentsView.backgroundColor = .white
        buttonView.backgroundColor = .gray
        deleteButton.tintColor = .white
    }
}
