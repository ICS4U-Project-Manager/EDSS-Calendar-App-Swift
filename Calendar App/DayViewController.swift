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
public var titlename : String = ""

class DayViewController: UIViewController {
    
    @IBOutlet weak var dayLabel: UILabel!
    
    var db = Firestore.firestore()
    var events = [event]()
    
    override func viewDidLoad() {
        
        print (num)
        
        super.viewDidLoad()
                
                dayLabel.text = CalendarHelper().monthString(date: selectedDate) + " " + dayNumString
                
                let dateFormatter2 = DateFormatter()
                dateFormatter2.dateStyle = .medium
                dateFormatter2.timeStyle = .none
                dateFormatter2.locale = Locale.current
                let dateR = dateFormatter2.string(from: selectedDate)
        
        db.collection("\(dateR)").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                print("No error getting documents")
                let document = querySnapshot?.documents
                let count3 = document!.count
                
                print(dateR)
                print("ee \(count3)")
                
                
                print ("rr \(CalendarHelper().monthString(date: selectedDate) + " " + dayNumString)")
                
                var YAxis = 300

                for i in 0..<count3 {
                    call()
                    func call(){
                        self.db.collection("\(dateR)").getDocuments() { (querySnapshot, err) in
                            if let err = err {
                                print("Error getting documents: \(err)")
                            } else {
                                print("No error getting documents")
                                let document = querySnapshot!.documents[num]
                                print("\(document.data()["name"] as! String)")
                                
                                
                                build()
                                
                                func build() {
                                    
                                    num += 1
                                    
                                    let buttonX = 100
                                    let buttonY = YAxis
                                    let buttonWidth = 300
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
}



@objc func buttonClicked(sender : UIButton){
    switch (sender.tag){
    case 0:
        db.collection("June 16 2022").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                let document = querySnapshot!.documents[num]
                print("\(document.data()["name"] as! String)")
            }
        }
        print("\(titlename)")
    case 1:
        print("\(titlename)")
    case 2:
        print("\(titlename)")
    case 3:
        print("\(titlename)")
    case 4:
        print("\(titlename)")
    default:
        print("\(titlename)")
    }
}
}





