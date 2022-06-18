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
    
  

    let startDate = ([startEventMonth,startEventDay,startEventYear,startEventHour,startEventMinute] as? Timestamp)?.dateValue() ?? Date()
    let dateFormatter6 = DateFormatter()
    dateFormatter6.dateStyle = .medium
    dateFormatter6.timeStyle = .none
    dateFormatter6.locale = Locale.current
    let dateF = dateFormatter6.string(from: startDate)
    
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "MMMdd"
    let dateP = dateFormatterGet.date(from: "\(startDate)")

    let endDate = ([endEventMonth,endEventDay,endEventYear,endEventHour,endEventMinute] as? Timestamp)?.dateValue() ?? Date()

    
    print ("zz\(dateP)")
    let db = Firestore.firestore()
    db.collection("\(dateP)").addDocument(data:["name":"\(event.getName())","endDate": endDate,"startDate":startDate, "description": "\(event.getDescription())", "location": "\(event.getLocation())", "group": "\(event.getGroup())", "idd": 1]) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            selectedDate = startDate
            print("Document successfully written!")
        }
    }
}
