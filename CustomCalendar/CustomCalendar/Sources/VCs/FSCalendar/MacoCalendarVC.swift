//
//  MacoCalendarVC.swift
//  CustomCalendar
//
//  Created by soyeon on 2021/09/17.
//

import UIKit
import FSCalendar

class MacoCalendarVC: UIViewController {
    
    // MARK: - Properties
    
    private lazy var calender: FSCalendar = {
        let calendar = FSCalendar()
        
        calendar.appearance.weekdayTextColor = .macoDarkGray
        calendar.appearance.headerTitleColor = .macoDarkGray
        calendar.appearance.eventDefaultColor = .macoDarkGray
        calendar.appearance.selectionColor = .clear
        calendar.appearance.titleSelectionColor = .macoDarkGray
        calendar.appearance.todayColor = .clear
        calendar.appearance.todaySelectionColor = .clear
        calendar.appearance.titleTodayColor = .macoDarkGray
        calendar.appearance.titleDefaultColor = .macoDarkGray
        
        calendar.headerHeight = 50
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.headerTitleFont = .systemFont(ofSize: 24)
        calendar.appearance.headerSeparatorColor = .red
        
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.weekdayHeight = 30
        calendar.rowHeight = 75
        calendar.appearance.separators = .interRows
        calendar.scrollEnabled = true
        
        return calendar
    }()
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
//        label.font = .macoFont(type: .medium, size: 18)
        label.textAlignment = .left
        let values = Calendar.current.dateComponents([Calendar.Component.month, Calendar.Component.year], from: self.calender.currentPage)
        
        self.year = values.year!
        self.month = values.month!
        label.text = "\(year)년 \(month)월"
        
        print(dateFormatter.string(from: self.calender.currentPage))
        return label
    }()
    
    private lazy var monthWeekSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .macoGray
        return view
    }()
    
    private lazy var weekDateSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .macoLightGray
        return view
    }()
    
    private lazy var pastMonthButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icBackSmall"), for: .normal)
        button.addTarget(self, action: #selector(tapMoveDateButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextMonthButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icNextSmall"), for: .normal)
        button.addTarget(self, action: #selector(tapMoveDateButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var pastYearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icNextX2Back"), for: .normal)
        button.addTarget(self, action: #selector(tapMoveDateButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextYearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icNextX2Small"), for: .normal)
        button.addTarget(self, action: #selector(tapMoveDateButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    // MARK: - Local Variables
    
    private lazy var part: Int = 1
    private lazy var i = 0
    
    private lazy var year = 2021
    private lazy var month = 1

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        layoutCalender()
    }
    
    func layoutCalender() {
        view.backgroundColor = .white
        view.addSubviews(calender, headerLabel, monthWeekSeparatorView, weekDateSeparatorView, buttonStackView)
        
        calender.delegate = self
        calender.dataSource = self
        
        calender.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(150)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        
        calender.register(MacoCalendarCell.self, forCellReuseIdentifier: MacoCalendarCell.identifier)

        calender.calendarHeaderView.isHidden = true
        
        headerLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalTo(calender.calendarWeekdayView.snp.top).offset(-8)
        }
        
        monthWeekSeparatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalTo(calender.calendarWeekdayView.snp.top)
        }
        
        weekDateSeparatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        buttonStackView.addArrangedSubviews(pastYearButton, pastMonthButton, nextMonthButton, nextYearButton)
        
        buttonStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalTo(headerLabel.snp.centerY)
        }
    }
    
    @objc
    func tapMoveDateButton(_ sender: UIButton) {
        var moveDate: Date?
        
        switch sender {
        case pastMonthButton:
            moveDate = Calendar.current.date(byAdding: .month, value: -1, to: self.calender.currentPage)
            self.month -= 1
        case pastYearButton:
            moveDate = Calendar.current.date(byAdding: .year, value: -1, to: self.calender.currentPage)
            self.year -= 1
        case nextMonthButton:
            moveDate = Calendar.current.date(byAdding: .month, value: 1, to: self.calender.currentPage)
            self.month += 1
        case nextYearButton:
            moveDate = Calendar.current.date(byAdding: .year, value: 1, to: self.calender.currentPage)
            self.year += 1
        default:
            break
        }
        
        if let moveDate = moveDate {
            self.calender.setCurrentPage(moveDate, animated: true)
            
            headerLabel.text = "\(year)년 \(month)월"
        }
    }
}

extension MacoCalendarVC: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
      
       if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
       } else {
            
       }
    }
    
}

extension MacoCalendarVC: FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        guard let cell = calendar.dequeueReusableCell(withIdentifier: MacoCalendarCell.identifier, for: date, at: position) as? MacoCalendarCell else { return FSCalendarCell() }
        
//        let nowMonth = String(Calendar.current.component(.month, from: Date()))
//        let month = String(Calendar.current.component(.month, from: date))
//        let nowDay = Int(Calendar.current.component(.day, from: Date()))
//        let nowDate = Date()
//        let nowYear = String(Calendar.current.component(.year, from: Date()))
//        
//        cell.setNumberLabel(count: -1)
//        
//        if date <= nowDate {
//            
//        } else {
//            cell.setNumberLabel(count: -1)
//        }
        return cell
    }
    
}


