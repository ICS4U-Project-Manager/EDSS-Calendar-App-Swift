//
//  Firestore Get.swift
//  Calendar App
//
//  Created by Kyle Stirbet on 2022-05-21.
//


import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase
import SwiftUI

class userViewModel: ObservableObject {
    
    @Published var users = [User]()
    var num : Int = 0
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("users").whereField("idd", isEqualTo: num).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.users = documents.map { (queryDocumentSnapshot) -> User in
                let data = queryDocumentSnapshot.data()
                let Title = data["Title"] as? String ?? ""
                let Body = data["Body"] as? String ?? ""
                let Lines = data["Lines"] as? String ?? ""
                let idd = data["idd"] as? Int ?? 0
                print (Title)
                return User(Title: Title, Body: Body, Lines: Lines, idd: idd)
            }
        }
    }
}
