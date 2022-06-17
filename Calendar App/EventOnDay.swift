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

var db = Firestore.firestore()

db.collection("\(dateR)").getDocuments() { (querySnapshot, err) in
    if let err = err {
        print("Error getting documents: \(err)")
    } else {
        print("No error getting documents")
        let document = querySnapshot?.documents
        count3 = document!.count
    }
}
