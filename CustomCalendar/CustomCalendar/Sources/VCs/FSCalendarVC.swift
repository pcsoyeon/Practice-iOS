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
        
        view.backgroundColor = .white
        
        calendar.dataSource = self
        calendar.delegate = self
        
        calendar.locale = Locale(identifier: "ko_KR")
        
        view.addSubview(calendar)
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        calendar.centerYAnchor.constraint(equalTo:view.centerYAnchor).isActive = true
        calendar.heightAnchor.constraint(equalToConstant: 400).isActive = true
        calendar.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    func setUpEvents() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        let xmas = formatter.date(from: "2020-12-25")
        let sampledate = formatter.date(from: "2020-08-22")
        events = [xmas!, sampledate!]
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
