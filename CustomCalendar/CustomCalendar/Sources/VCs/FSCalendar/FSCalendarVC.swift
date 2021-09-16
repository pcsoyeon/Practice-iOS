//
//  FSCalendarVC.swift
//  CustomCalendar
//
//  Created by soyeon on 2021/09/16.
//

import UIKit
import FSCalendar

class FSCalendarVC: UIViewController {

    private var calendar = FSCalendar()
    
    var events = [Date()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initUI()
        self.initCalendar()
        
        self.setUpEvents()
    }
}

extension FSCalendarVC {
    private func initUI() {
        view.backgroundColor = .white
        
        view.addSubview(calendar)
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        calendar.centerYAnchor.constraint(equalTo:view.centerYAnchor).isActive = true
        calendar.heightAnchor.constraint(equalToConstant: 400).isActive = true
        calendar.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    private func initCalendar() {
        calendar.dataSource = self
        calendar.delegate = self
        
        calendar.locale = Locale(identifier: "ko_KR")
        
        calendar.appearance.selectionColor = .systemTeal
        calendar.appearance.todayColor = .systemBlue
        
        calendar.allowsMultipleSelection = true
        calendar.swipeToChooseGesture.isEnabled = true
    }
    
    private func setUpEvents() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        let xmas = formatter.date(from: "2021-12-25")
        let birthDay = formatter.date(from: "2021-09-30")
        events = [xmas!, birthDay!]
    }
}

extension FSCalendarVC: FSCalendarDataSource, FSCalendarDelegate  {
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if self.events.contains(date) {
            return 1
        } else {
            return 0
        }
    }
}
