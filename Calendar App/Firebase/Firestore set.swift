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

func add(startEventMonth : Int, startEventDay : Int, startEventYear : Int, startEventHour : Int, startEventMinute : Int, endEventMonth : Int, endEventDay : Int, endEventYear : Int, endEventHour : Int, endEventMinute : Int, event : ICSEvent){
    
    print("yes it is working")

    let startDate = ([startEventMonth,startEventDay,startEventYear,startEventHour,startEventMinute] as? Timestamp)?.dateValue() ?? Date()
    let dateFormatter6 = DateFormatter()
    dateFormatter6.dateStyle = .medium
    dateFormatter6.timeStyle = .none
    dateFormatter6.locale = Locale.current
    let dateF = dateFormatter6.string(from: startDate)

    let endDate = ([endEventMonth,endEventDay,endEventYear,endEventHour,endEventMinute] as? Timestamp)?.dateValue() ?? Date()

    
    print (dateF)

    let db = Firestore.firestore()
    db.collection("\(dateF)").addDocument(data:["name":"\(event.getName())","endDate": endDate,"startDate":startDate, "description": "\(event.getDescription())", "location": "\(event.getLocation())", "group": "WRDSB Student", "idd": 0]) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
}
