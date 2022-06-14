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

    @IBOutlet weak var label: UILabel!
    
    var viewModel = userViewModel()
   
    
    override func viewDidLoad() {
<<<<<<< HEAD
        label.text = "user.Title"
=======
        
        self.db.collection("Events").getDocuments() { [self] (querySnapshot, error) in
            guard let documents2 = querySnapshot?.documents else {
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
                var startDateF: String {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "MMM d, yyyy"
                    return formatter.string(from: startDate)
                }
                var startTimeF: String {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "hh:mm"
                    return formatter.string(from: startDate)
                }
                let endDate = (data2["endDate"] as? Timestamp)?.dateValue() ?? Date()
                var endDateF: String {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "MMM d, yyyy"
                    return formatter.string(from: endDate)
                }
                var endTimeF: String {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "hh:mm"
                    return formatter.string(from: endDate)
                }
                
                self.name.text = name
                self.startDate.text = startDateF
                self.startTime.text = startTimeF
                self.endDate.text = endDateF
                self.endTime.text = endTimeF
                self.group.text = group
                self.descript.text = description
                
                
                
                return event(name: name, description: description, location: location, group: group, idd: idd, startDate: startDate)
            }
        }
>>>>>>> Kyle-2.00
    }
}

