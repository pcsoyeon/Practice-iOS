//
//  Date+.swift
//  CustomCalendar
//
//  Created by soyeon on 2021/09/16.
//

import Foundation

//get first day of the month
extension Date {
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
}
