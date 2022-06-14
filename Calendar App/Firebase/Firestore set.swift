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
    
    var viewModel = userViewModel()
    let event : ICSEvent?

func viewDidLoad() {
    if let label:String = event?.getName() {
        print(label)
    }
    else {
        print("event not found")
    }
    }
    
    let db = Firestore.firestore()
    db.collection("cities").document("LA").setData([:]) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
}
