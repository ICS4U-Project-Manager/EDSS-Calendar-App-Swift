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
    let db = Firestore.firestore()
db.collection("cities").document("LA").setData([
    "name": "Los Angeles",
    "state": "CA",
    "country": "USA"
]) { err in
    if let err = err {
        print("Error writing document: \(err)")
    } else {
        print("Document successfully written!")
    }
}
}
