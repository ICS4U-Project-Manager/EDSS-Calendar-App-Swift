//
//  DayViewController.swift
//  Calendar App
//
//  Created by Zack Liam and Lucas on 2022-05-16.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseCore
import FirebaseStorage

var num = 0
var dateR : String = ""
public var titlename : String = ""
var count3 : Int = 0

class DayViewController: UIViewController {
    
    @IBOutlet weak var dayLabel: UILabel!
    
    var db = Firestore.firestore()
    var events = [event]()
    
    override func viewDidLoad() {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.center = CGPoint(x: 100, y: 140)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Start Time - End Time"
       
        
        let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label2.center = CGPoint(x: 275, y: 140)
        label2.textAlignment = .center
        label2.textColor = .black
        label2.text = "Event Title"
        
        self.view.addSubview(label)
        self.view.addSubview(label2)
        
        dateR = ""
        titlename = ""
        count3 = 0
        num = 0
        print (num)
        
        super.viewDidLoad()
        
        print("ds \(selectedDate)")
        
        dayLabel.text = CalendarHelper().monthString(date: selectedDate) + " " + dayNumString
        dayLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 21)

        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MMM dd"
        let dateR = dateFormatterGet.date(from: "\(CalendarHelper().monthString(date: selectedDate) + " " + dayNumString) ")
        
        db.collection("\(CalendarHelper().monthString(date: selectedDate) + " " + dayNumString)").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                print("No error getting documents")
                let document = querySnapshot?.documents
                count3 = document!.count
                
                print("cx \(CalendarHelper().monthString(date: selectedDate) + " " + dayNumString)")
                print("ee \(count3)")
                
                
                print ("rr \(CalendarHelper().monthString(date: selectedDate) + " " + dayNumString)")
                
                var YAxis = 300
                
                for i in 0..<count3 {
                    call()
                    func call(){
                        self.db.collection("\(CalendarHelper().monthString(date: selectedDate) + " " + dayNumString)").getDocuments() { (querySnapshot, err) in
                            if let err = err {
                                print("Error getting documents: \(err)")
                            } else {
                                print("No error getting documents")
                                let document = querySnapshot!.documents[num]
                                
                                let startDate = (document.data()["startDate"] as? Timestamp)?.dateValue() ?? Date()
                                var startDatew: String {
                                    let formatter = DateFormatter()
                                    formatter.dateFormat = "MMM d hh:mm"
                                    return formatter.string(from: startDate)
                                }
                                let endDate = (document.data()["startDate"] as? Timestamp)?.dateValue() ?? Date()
                                var endDatew: String {
                                    let formatter = DateFormatter()
                                    formatter.dateFormat = "MMM d hh:mm"
                                    return formatter.string(from: endDate)
                                }
                            
                                
                                build()
                                
                                func build() {
                                    
                                    num += 1
                                    
                                    let buttonX = 0
                                    let buttonY = YAxis
                                    let buttonWidth = 375
                                    let buttonHeight = 50
                                    
                                    let button = UIButton(type: .system)
                                    button.setTitle("\(startDatew) ... \(endDatew) ........ \(document.data()["name"] as! String)   ", for: .normal)
                                    button.tintColor = .white
                                    button.backgroundColor = UIColor(named: "Dark green")
                                    button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
                                    button.tag = i
                                    button.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
                                    self.view.addSubview(button)
                                    
                                    YAxis -= 75
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
        
        
    }
    
    
    
    @objc func buttonClicked(sender : UIButton){
        for i in 0..<count3 {
            switch (sender.tag){
            case i:
                num = i
                
                print("fd \(CalendarHelper().monthString(date: selectedDate) + " " + dayNumString)")
                let db = Firestore.firestore()
                db.collection("\(CalendarHelper().monthString(date: selectedDate) + " " + dayNumString)").getDocuments() { (querySnapshot, err) in
                    let document = querySnapshot?.documents[num]
                    titlename = document!.data()["name"] as! String
                    print("hg \(titlename)")
                    titlename = document!.data()["name"] as! String
                    print("hg2 \(titlename)")
                    call()
                }
                func call(){
                performSegue (withIdentifier: "Firebase", sender: self)
                }
            default:
                print("nothing worked")
            }
        }
    }
}







