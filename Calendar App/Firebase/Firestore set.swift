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

    
    let endDate = ([endEventMonth,endEventDay,endEventYear,endEventHour,endEventMinute] as? Timestamp)?.dateValue() ?? Date()

    
    print (startDate)

    let db = Firestore.firestore()
    db.collection("Events").addDocument(data:["name":"\(eventTitle)","endDate": endDate,"startDate":startDate, "description": "\(eventDescription)", "location": "\(eventLocation)", "group": "WRDSB Student", "idd": eventIdentification]) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
}
