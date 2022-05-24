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

class SearchResultViewModel: ObservableObject {

var db = Firestore.firestore()
var testData = [Any]()


func fetchData() {
    db.collection("books").whereField("website", isEqualTo: 0).getDocuments() { (snap, err) in
        DispatchQueue.main.async { [self] in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            } else {
                for i in snap!.documentChanges{
                    
                    let id = i.document.documentID
                    let title = i.document.get("title") as? String ?? ""
                    let author = i.document.get("author") as? String ?? ""
                    let numberOfPages = i.document.get("numberOfPages") as? Int ?? 0

                    self.testData = [id, title, author, numberOfPages]
                    print(numberOfPages)
                    
                    }
                }
            }
        }
    }
}
