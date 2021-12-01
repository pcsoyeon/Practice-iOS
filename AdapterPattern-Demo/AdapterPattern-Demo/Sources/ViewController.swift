//
//  ViewController.swift
//  AdapterPattern-Demo
//
//  Created by soyeon on 2021/12/01.
//

import UIKit
import EventKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Usage
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"

        let eventStore = EKEventStore()
        let event = EKEvent(eventStore: eventStore)
        event.title = "Design Pattern Meetup"
        event.startDate = dateFormatter.date(from: "06/29/2018 18:00")
        event.endDate = dateFormatter.date(from: "06/29/2018 19:30")

        let adapter = EKEventAdapter(event: event)
        print(adapter.description)
    }
    
}

