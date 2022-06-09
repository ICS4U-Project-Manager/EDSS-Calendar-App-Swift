//
//  DayViewController.swift
//  Calendar App
//
//  Created by Zack Liam and Lucas on 2022-05-16.
//

import UIKit

class DayViewController: UIViewController {
    
    @IBOutlet weak var dayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayLabel.text = CalendarHelper().monthString(date: selectedDate)
    }
    @IBAction func EventDismiss(_ sender: UIStoryboardSegue) {
        
    }
}
