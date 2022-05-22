//
//  Firestore Get.swift
//  Calendar App
//
//  Created by Kyle Stirbet on 2022-05-21.
//

import Foundation
import FirebaseFirestore

class Announcements: ObservableObject {
  @Published var books = [Info]()
    @Published var Nothing = false
  
  private var db = Firestore.firestore()
  
  func fetchAnnouncements() {
      db.collection("books").whereField("id", isEqualTo: "0").addSnapshotListener { (querySnapshot, error) in
      guard let documents = querySnapshot?.documents else {
          self.Nothing = true
        print("No documents")
        return
      }

          self.Nothing = false
          
      self.books = documents.map { queryDocumentSnapshot -> Info in
        let data = queryDocumentSnapshot.data()
        let id = data["id"] as? String ?? ""
        let body = data["body"] as? String ?? ""
        let line = data["line"] as? String ?? ""
        let Title = data["Title"] as? String ?? ""

          return Info(id: id, body: body, line: line, Title: Title)
      }
    }
  }
}
