//
//  Firestore set.swift
//  Calendar App
//
//  Created by Kyle Stirbet on 2022-05-21.
//
//


import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase
import SwiftUI

func add(){

    let startDate = ([startEventMonth,startEventDay,startEventYear,startEventHour,startEventMinute] as? Timestamp)?.dateValue() ?? Date()
    var startDateF: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy hh:mm"
        return formatter.string(from: startDate)
    }
    
    let endDate = ([endEventMonth,endEventDay,endEventYear,endEventHour,endEventMinute] as? Timestamp)?.dateValue() ?? Date()
    var endDateF: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy hh:mm"
        return formatter.string(from: endDate)
    }
    
    
print(startDate)
    print(startDateF)
    
    
    print(eventTitle)
    let db = Firestore.firestore()
<<<<<<< HEAD
db.collection("cities").document("LA").setData([
    "name": "Los Angeles",
    "state": "CA",
    "country": "USA"
]) { err in
    if let err = err {
        print("Error writing document: \(err)")
    } else {
        print("Document successfully written!")
=======
    db.collection("Events").document("Date").setData(["name":"\(eventTitle)","endDate": endDate,"startDate":startDateF, "description": "\(eventDescription)", "location": "\(eventLocation)", "group": "group", "idd": 0, ]) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
>>>>>>> Kyle-2.00
    }
}
}
