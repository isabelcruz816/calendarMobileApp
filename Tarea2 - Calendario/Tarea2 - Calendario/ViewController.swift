//
//  ViewController.swift
//  Tarea2 - Calendario
//
//  Created by Isabel  Cruz on 24/02/20.
//  Copyright © 2020 Isabel  Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbMonth: UILabel!
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var lbWeekday: UILabel!
    
    func getDate(){
        let date = Date()
        
        // Genera el string para el año
        let yearFormatter = DateFormatter()
        yearFormatter.dateFormat = "YYYY"
        let yearString = yearFormatter.string(from: date)
        lbYear.text = yearString
        
        // Genera el string para el mes
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        let monthString = monthFormatter.string(from: date)
        lbMonth.text = monthString
        
        // Genera el string para el dia
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        let dayString = dayFormatter.string(from: date)
        lbNumber.text = dayString
        
        // Genera el string para el weekday
        let weekdayFormatter = DateFormatter()
        weekdayFormatter.dateFormat = "EEEE"
        let weekdayString = weekdayFormatter.string(from: date)
        lbWeekday.text = weekdayString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDate()
        // Do any additional setup after loading the view.
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(getLastDate(sender:)))
        rightSwipe.direction = .right
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(getNextDate(sender:)))
        leftSwipe.direction = .left
        
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(leftSwipe)
    }
    
    @objc func getNextDate(sender: UISwipeGestureRecognizer){
        let nextDate = Date(timeInterval: 86400, since: Date())
        
        let nextDayFormatter = DateFormatter()
        nextDayFormatter.dateFormat = "dd"
        let nextDayString = nextDayFormatter.string(from: nextDate)
        lbNumber.text = nextDayString
        
        let nextWeekdayFormatter = DateFormatter()
        nextWeekdayFormatter.dateFormat = "EEEE"
        let nextWeekdayString = nextWeekdayFormatter.string(from: nextDate)
        lbWeekday.text = nextWeekdayString
    }
    
    @objc func getLastDate(sender: UISwipeGestureRecognizer){
        let lastDate = Date(timeInterval: -86400, since: Date())
        
        let lastDayFormatter = DateFormatter()
        lastDayFormatter.dateFormat = "dd"
        let lastDayString = lastDayFormatter.string(from: lastDate)
        lbNumber.text = lastDayString
        
        let lastWeekdayFormatter = DateFormatter()
        lastWeekdayFormatter.dateFormat = "EEEE"
        let lastWeekdayString = lastWeekdayFormatter.string(from: lastDate)
        lbWeekday.text = lastWeekdayString
    }
}

