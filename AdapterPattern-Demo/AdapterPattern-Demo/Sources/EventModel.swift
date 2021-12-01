//
//  Event.swift
//  AdapterPattern-Demo
//
//  Created by soyeon on 2021/12/01.
//

import Foundation

protocol Event: class {
    var title: String { get }
    var startDate: String { get }
    var endDate: String { get }
}

extension Event {
    var description: String {
        return "Name: \(title)\nEvent start: \(startDate)\nEvent end: \(endDate)"
    }
}

class LocalEvent: Event {
    var title: String
    var startDate: String
    var endDate: String
    
    init(title: String, startDate: String, endDate: String) {
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
    }
}
