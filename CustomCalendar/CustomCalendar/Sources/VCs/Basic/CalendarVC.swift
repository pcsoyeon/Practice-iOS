//
//  CalendarVC.swift
//  CustomCalendar
//
//  Created by soyeon on 2021/09/16.
//

import UIKit

class CalendarVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var weekdayCollectionView: UICollectionView!
    @IBOutlet weak var dateCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    let dateFormatter = DateFormatter()
    var components = DateComponents()
    var weeks: [String] = ["일", "월", "화", "수", "목", "금", "토"]
    var days: [String] = []
    var daysCountInMonth = 0
    var weekdayAdding = 0
    
    // MARK: - Dummy Data
    
    let dummyFormatter = DateFormatter()
    var dummyDate: [String] = ["2021-09-30", "2022-01-01", "2021-02-18", "2021-11-16", "2021-11-27", "2021-04-26", "2021-06-18", "2021-06-25"]
    var monthDate: [String] = []
    var dayAndYear = ""
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCalendar()
        makeMonthDate()
        initView()
    }
    
    @IBAction func previousButtonClicked(_ sender: Any) {
        components.month = components.month! - 1
        self.calculation()
        self.makeMonthDate()
        self.dateCollectionView.reloadData()
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        components.month = components.month! + 1
        self.calculation()
        self.makeMonthDate()
        self.dateCollectionView.reloadData()
    }
}

// MARK: - Calendar Button Methods

extension CalendarVC {
    private func calculation() {
        let firstDayOfMonth = Calendar.current.date(from: components)
        let firstWeekday = Calendar.current.component(.weekday, from: firstDayOfMonth!)
        daysCountInMonth = Calendar.current.range(of: .day,
                                        in: .month,
                                        for: firstDayOfMonth!)!.count
        
        weekdayAdding = 2 - firstWeekday
        
        dateFormatter.dateFormat = "M월 YYYY"
        self.monthLabel.text = dateFormatter.string(from: firstDayOfMonth!)
        
        self.days.removeAll()
        for day in weekdayAdding...daysCountInMonth {
            if day < 1 {
                self.days.append("")
            } else {
                self.days.append(String(day))
            }
        }
    }
    
    private func makeMonthDate() {
        monthDate.removeAll()
        dayAndYear = ""
        
        let firstDayOfMonth = Calendar.current.date(from: components)
        dateFormatter.dateFormat = "YYYY"
        
        let year = dateFormatter.string(from: firstDayOfMonth!)
        dateFormatter.dateFormat = "MM"
        
        let month = dateFormatter.string(from: firstDayOfMonth!)
        dayAndYear = year + "." + month
        
        dummyFormatter.dateFormat = "YYYY"
        
        for date in dummyDate {
            let string = date.split(separator: "-")
            
            if string[0] == year && string[1] == month {
                let day = (string[2] as NSString).integerValue
                monthDate.append("\(day)")
            }
        }
        
        print("✅", monthDate)
    }
}

// MARK: - Custom Methods

extension CalendarVC {
    private func initView() {
        initUI()
        initCollectionView()
        self.calculation()
    }
    
    private func initUI() {
        view.backgroundColor = .white
        
        monthLabel.textColor = .systemBlue
        monthLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        dateFormatter.dateFormat = "M월 YYYY"
    }
    
    private func initCollectionView() {
        weekdayCollectionView.register(DayCell.self, forCellWithReuseIdentifier: DayCell.identifier)
        weekdayCollectionView.delegate = self
        weekdayCollectionView.dataSource = self
        
        dateCollectionView.register(DayCell.self, forCellWithReuseIdentifier: DayCell.identifier)
        dateCollectionView.delegate = self
        dateCollectionView.dataSource = self
    }
    
    private func initCalendar() {
        components.year = Calendar.current.component(.year, from: Date())
        components.month = Calendar.current.component(.month, from: Date())
        components.day = 1
    }
}

// MARK: - UICollectionView

extension CalendarVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let weekBoundSize = UIScreen.main.bounds.size.width - 32 - 42
        let dayBoundSize = UIScreen.main.bounds.size.width - 32 - 24
        var cellSize = 0
        
        switch collectionView {
        case weekdayCollectionView:
            cellSize = Int(weekBoundSize / 7)
            return CGSize(width: cellSize,
                            height: 43)
        default:
            cellSize = Int(dayBoundSize / 7)
            return CGSize(width: cellSize,
                            height: 51)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case weekdayCollectionView:
            return 7
        default:
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

extension CalendarVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:Int) -> Int {
        if collectionView == weekdayCollectionView {
            return 7
        } else {
            return days.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case weekdayCollectionView:
            let cell = weekdayCollectionView.dequeueReusableCell(withReuseIdentifier: DayCell.identifier, for: indexPath) as! DayCell
            
            cell.dataLabel.text = weeks[indexPath.row]
            
            cell.dataLabel.font = UIFont.systemFont(ofSize: 15)
            cell.dataLabel.textColor = .black
            
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:DayCell.identifier, for: indexPath) as! DayCell
            
            cell.dataLabel.text = days[indexPath.row]
            cell.dataLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            cell.dataLabel.textColor = .black
            
            if !monthDate.isEmpty {
                if monthDate[0] == days[indexPath.row] {
                    cell.characterImage.isHidden = false
                    
                    cell.countLabel.text = "written"
                    cell.countLabel.textAlignment = .center
                    cell.countLabel.textColor = .black
                    cell.countLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
                    
                    cell.dataLabel.isHidden = true
                    monthDate.removeFirst()
                } else {
                    cell.dataLabel.isHidden = false
                    cell.characterImage.isHidden = true
                    cell.countLabel.text = ""
                }
            } else {
                cell.dataLabel.isHidden = false
                cell.characterImage.isHidden = true
                cell.countLabel.text = ""
            }
            
            return cell
        }
    }
}
