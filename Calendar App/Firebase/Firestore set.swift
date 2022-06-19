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
    
    print("the \(date9)")
    print("gfugih \(GetStartDate)")
    print("jghgf \(GetStartTime)")
    
    
    titlename = ("\(event.getName())")
    print ("titlename: \(event.getName())")
    
    let db = Firestore.firestore()
    db.collection("ghj").addDocument(data:["name":"\(event.getName())","endDate": Date(),"startDate":Date(), "description": "\(event.getDescription())", "location": "\(event.getLocation())", "group": "\(event.getGroup())", "idd": 1]) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            selectedDate = Date()
            print("Document successfully written!")
        }
    }
}
