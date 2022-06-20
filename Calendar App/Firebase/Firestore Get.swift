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
    var num90 : Int = 0
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("users").whereField("idd", isEqualTo: num90).addSnapshotListener { (querySnapshot, error) in
            let documents = querySnapshot?.documents
            let count = documents!.count
        
            if count < self.num90 {
                self.num90 = 0
            }
            else if self.num90 == -1 {
                self.num90 = 0
            }
        
            self.db.collection("users").whereField("idd", isEqualTo: self.num90).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                self.num90 = 0
                print("No documents")
                return
            }
            
            self.users = documents.map { (queryDocumentSnapshot) -> User in
                let data = queryDocumentSnapshot.data()
                let Title = data["Title"] as? String ?? ""
                let Body = data["Body"] as? String ?? ""
                let Lines = data["Lines"] as? String ?? ""
                let idd = data["idd"] as? Int ?? 0

                return User(Title: Title, Body: Body, Lines: Lines, idd: idd)
                }
            }
        }
    }
}
