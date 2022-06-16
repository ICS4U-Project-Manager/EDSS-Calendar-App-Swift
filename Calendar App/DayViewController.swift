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



class DayViewController: UIViewController {
    
    @IBOutlet weak var dayLabel: UILabel!
    
    var db = Firestore.firestore()
    var events = [event]()
    
    override func viewDidLoad() {
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
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    print("\(document.data()["name"] as! String)")
                    
                    
                    print ("rr \(dateR)")
                    
                    
                    
                    self.db.collection("\(dateR)").getDocuments() { [self] (querySnapshot, error) in
                        guard let documents2 = querySnapshot?.documents else {
                            print("No documents")
                            return
                        }
                        
                        print("\(document)")
                        
                        let count = documents2.count
                        self.events = documents2.map { (queryDocumentSnapshot) -> event in
                            let data2 = queryDocumentSnapshot.data()
                            let name=data2["name"]! as! String
                            let description=data2["description"]! as? String ?? ""
                            let location=data2["location"]! as? String ?? ""
                            let group=data2["group"]! as? String ?? ""
                            let idd=data2["idd"]! as? Int ?? 0
                            let startDate = (data2["startDate"] as? Timestamp)?.dateValue() ?? Date()
                            var startDateR: String {
                                let formatter = DateFormatter()
                                formatter.dateFormat = "EEEE, MMM d, yyyy hh:mm"
                                return formatter.string(from: startDate)
                            }
                            let endDate = (data2["endDate"] as? Timestamp)?.dateValue() ?? Date()
                            var endDateR: String {
                                let formatter = DateFormatter()
                                formatter.dateFormat = "EEEE, MMM d, yyyy hh:mm"
                                return formatter.string(from: endDate)
                            }
                            
                            var YAxis = 300
                            
                            build()
                            build()
                            build()
                            
                            func build() {
                                let buttonX = 100
                                let buttonY = YAxis
                                let buttonWidth = 300
                                let buttonHeight = 50
                                
                                let button = UIButton(type: .system)
                                button.setTitle("\(document.data()["name"])", for: .normal)
                                button.tintColor = .white
                                button.backgroundColor = .red
                                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
                                button.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
                                self.view.addSubview(button)
                                
                                YAxis -= 75
                            }
                            
                            return event(name: name, description: description, location: location, group: group, idd: idd, startDate: startDate)
                        }
                    }
                }
            }
        }
    }
    
    
    @objc func buttonClicked(sender : UIButton){
        print("ok")
    }
    
}
