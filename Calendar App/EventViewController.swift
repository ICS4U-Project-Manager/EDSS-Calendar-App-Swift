//
//  EventViewController.swift
//  Calendar App
//
//  Created by Zack Liam and Lucas on 2022-05-16.
//
import UIKit
import Firebase
import FirebaseFirestore
import FirebaseCore
import FirebaseStorage

class EventViewController: UIViewController {
    
    @IBOutlet weak var name5: UILabel!
    @IBOutlet weak var endDate5: UILabel!
    @IBOutlet weak var startDate5: UILabel!
    @IBOutlet weak var location5: UILabel!
    @IBOutlet weak var descript: UILabel!
    @IBOutlet weak var group5: UILabel!
    
    var db = Firestore.firestore()
    var events = [event]()
    
    override func viewDidLoad() {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MMM dd"
        let dateZ = dateFormatterGet.date(from: "\(selectedDate)")
        
        print ("cc \(dateZ)")
        
        self.db.collection("\(dateZ)").getDocuments() { [self] (querySnapshot, error) in guard let documents2 = querySnapshot?.documents else {
                print("No documents")
                return
            }
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
                
                name5.text = name
                startDate5.text = startDateR
                location5.text = location
                group5.text = group
                descript.text = description
                endDate5.text = endDateR
                
                return event(name: name, description: description, location: location, group: group, idd: idd, startDate: startDate)
            }
        }
    }
}


struct event: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var description: String
    var location: String
    var group: String
    var idd: Int
    var startDate: Date
}
