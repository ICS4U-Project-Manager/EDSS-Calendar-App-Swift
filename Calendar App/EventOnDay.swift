//
//  EventOnDay.swift
//  Calendar App
//
//  Created by Kyle Stirbet on 2022-06-17.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseCore
import FirebaseStorage

var count9 = 0
func EventDay() {
var db = Firestore.firestore()

db.collection("Jun 20, 2022").getDocuments() { (querySnapshot, err) in
    if let err = err {
        print("Error getting documents: \(err)")
       count9 = 0
    } else {
        print("No error getting documents")
        let document = querySnapshot?.documents
        count9 = document!.count
        
        print(count9)
        }
    }
}
