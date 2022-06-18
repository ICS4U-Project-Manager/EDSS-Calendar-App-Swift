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
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 50, y: 166)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Start Time - End Time"
        self.view.addSubview(label)
        
        let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label2.center = CGPoint(x: 275, y: 166)
        label2.textAlignment = .center
        label2.textColor = .black
        label2.text = "Event Title"
        self.view.addSubview(label2)
        
        dateR = ""
        titlename = ""
        count3 = 0
        num = 0
        print (num)
        
        super.viewDidLoad()
        
        print("ds \(selectedDate)")
        
        dayLabel.text = CalendarHelper().monthString(date: selectedDate) + " " + dayNumString
        
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
                
                var YAxis = 250
                
                for i in 0..<count3 {
                    call()
                    func call(){
                        self.db.collection("\(CalendarHelper().monthString(date: selectedDate) + " " + dayNumString)").getDocuments() { (querySnapshot, err) in
                            if let err = err {
                                print("Error getting documents: \(err)")
                            } else {
                                print("No error getting documents")
                                let document = querySnapshot!.documents[num]
                                
                                build()
                                
                                func build() {
                                    
                                    num += 1
                                    
                                    let buttonX = 160
                                    let buttonY = YAxis
                                    let buttonWidth = 400
                                    let buttonHeight = 50
                                    
                                    let button = UIButton(type: .system)
                                    button.setTitle("\(document.data()["name"] as! String)", for: .normal)
                                    button.tintColor = .white
                                    button.backgroundColor = .red
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
        
        func butonClicked(_ sender: Any){
                    self.performSegue (withIdentifier: "FirstSegue", sender: self)
                }
    }
    

    
    @objc func buttonClicked(sender : UIButton){
        for i in 0..<count3 {
            switch (sender.tag){
            case i:
                num = i
                Calling()
            default:
                print("nothing worked")
            }
        }
    }
}

func Calling(){
    let db = Firestore.firestore()
    db.collection("\(dateR)").getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            let document = querySnapshot?.documents[num]
            titlename = document!.data()["name"] as! String
            print("\(titlename)")

        }
    }
}
    




