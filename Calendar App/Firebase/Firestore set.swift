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
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d"
    let resultString = dateFormatter.string(from: selectedDate4)
    print("yu \(selectedDate7)")
    print(resultString)
    
    print ("zz\(resultString)")
    let db = Firestore.firestore()
    db.collection("\(resultString)").addDocument(data:[
        "name":"\(event.getName())",
        "endDate": selectedDate6,
        "startDate":selectedDate4,
        "description": "\(event.getDescription())",
        "location": g"\(event.getLocation())",
        "group": "\(event.getGroup())",
        "idd": 1]) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            selectedDate = selectedDate4
            print("Document successfully written!")
        }
    }
}
