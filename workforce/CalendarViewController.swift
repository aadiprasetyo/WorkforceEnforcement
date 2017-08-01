//
//  CalendarViewController.swift
//  workforce
//
//  Created by admin on 7/26/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController{
   
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var labelYearBefore: UILabel!
    @IBOutlet weak var labelYearAfter: UILabel!
    @IBOutlet weak var labelMonthBefore: UILabel!
    @IBOutlet weak var labelMonthAfter: UILabel!
    
    let outsideMonthColor = UIColor.lightGray
    let monthColor = UIColor.black
    let selectedMonthColor = UIColor(colorWithHexValue: 0x469689)
    let currentDateSelectedViewColor = UIColor(colorWithHexValue: 0x469689)
    
    let formatter = DateFormatter()
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCalendarView()
        calendarView.scrollToDate(Date.init())
        tabBarController?.navigationItem.title = "Calendar"
        // Do any additional setup after loading the view.
    }
    func setupCalendarView(){
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        
        calendarView.visibleDates{ (visibleDates) in
            self.setupViewsOfCalendar(from: visibleDates)
            
               }
    }
    
    
    
    
   override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "Calendar"
    
    }
    
    func handleCelltextColor(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CalendarCell else {return}
        
        if cellState.isSelected {
            validCell.dateLabel.textColor = selectedMonthColor
            
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                validCell.dateLabel.textColor = monthColor
            } else {
                validCell.dateLabel.textColor = outsideMonthColor
            }
        
        }
        
    }
    
    
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo){
        let date = visibleDates.monthDates.first!.date
        self.formatter.dateFormat = "MMMM"
        var monthB: String? = ""
        var monthA: String? = ""
        self.month.text = self.formatter.string(from: date)
        self.formatter.dateFormat = "YYYY"
        self.year.text = self.formatter.string(from: date)
        self.formatter.dateFormat = "M"
        let number = Int(self.formatter.string(from: date))
        if number == 12 || number == 1 {
            if number == 12 {
                monthB = self.formatter.monthSymbols[10]
                monthA = self.formatter.monthSymbols[0]
                self.labelYearBefore.text = self.year.text
                self.labelYearAfter.text = String(Int(self.year.text!)! + 1)
            }else if number == 1 {
                monthB = self.formatter.monthSymbols[11]
                monthA = self.formatter.monthSymbols[1]
                self.labelYearBefore.text = String(Int(self.year.text!)! - 1)
                self.labelYearAfter.text = self.year.text
            }
        }else{
            monthB = self.formatter.monthSymbols[(number!-1)-1]
            monthA = self.formatter.monthSymbols[(number!+1)-1]
            self.labelYearBefore.text = self.year.text
            self.labelYearAfter.text = self.year.text
        }
        self.labelMonthBefore.text = monthB!
        self.labelMonthAfter.text = monthA!
        

        
        
    }
    
    func handleCurrentDay(view: JTAppleCell?, cellState: CellState){
        guard let validCell = view as? CalendarCell else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"
        
        let currentDay = Date()
        
        let currentDateString = dateFormatter.string(from: currentDay)
        let cellStateDateString = dateFormatter.string(from: cellState.date)
        
        if  currentDateString ==  cellStateDateString {
            validCell.selectedView.isHidden = false
            
        }
    }
    
    func handleCellSelected(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CalendarCell else { return }
        if cellState.isSelected {
            validCell.selectedView.isHidden = false
        } else {
            validCell.selectedView.isHidden = true
        }
    

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}

extension CalendarViewController:  JTAppleCalendarViewDataSource{
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2016 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
   
}

extension CalendarViewController: JTAppleCalendarViewDelegate {
    
    public func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        cell.dateLabel.text = cellState.text
        handleCellSelected(view: cell, cellState: cellState)
        handleCelltextColor(view: cell, cellState: cellState)
        handleCurrentDay(view: cell, cellState: cellState)
        
        return cell
        
    }
    public func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelected(view: cell, cellState: cellState)
        handleCelltextColor(view: cell, cellState: cellState)
        handleCurrentDay(view: cell, cellState: cellState)
    }
    
    public func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState){
        handleCellSelected(view: cell, cellState: cellState)
        handleCelltextColor(view: cell, cellState: cellState)
        handleCurrentDay(view: cell, cellState: cellState)

    }
    
    public func calendar(_ calendar: JTAppleCalendarView, willDisplayCell cell: JTAppleCell?, date: Date, cellState: CellState){
        let myCustomCell = cell as! CalendarCell // CellView is the class you created if you followed the Tutorial
        if cellState.dateBelongsTo == .thisMonth {
            // Make sure you cache your colors.
            // Creating them on the fly like this example makes a laggy calendar
            myCustomCell.dateLabel.textColor = UIColor.red
        } else {
            myCustomCell.dateLabel.textColor = UIColor.red
        }
    }
    
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        self.setupViewsOfCalendar(from: visibleDates)
    }
    
}

extension UIColor {
    convenience init(colorWithHexValue value: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
        
    }
}
    
    
    


