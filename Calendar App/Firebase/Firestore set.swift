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
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd"
    let dateZ = dateFormatter.string(from: selectedDate)
    
    let dateFormatter2 = DateFormatter()
    dateFormatter2.dateFormat = "MMM"
    let dateX = dateFormatter2.string(from: selectedDate)

    let endDate = ([endEventMonth,endEventDay,endEventYear,endEventHour,endEventMinute] as? Timestamp)?.dateValue() ?? Date()

    titlename = ("\(event.getName())")
    print ("titlename: \(event.getName())")
    print ("zz\(dateX) \(dateZ)")
    let db = Firestore.firestore()
    db.collection("\(dateX) \(dateZ)").addDocument(data:["name":"\(event.getName())","endDate": endDate,"startDate":startDate, "description": "\(event.getDescription())", "location": "\(event.getLocation())", "group": "\(event.getGroup())", "idd": 1]) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            selectedDate = startDate
            print("Document successfully written!")
        }
    }
}
