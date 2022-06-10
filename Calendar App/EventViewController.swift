//
//  EventViewController.swift
//  Calendar App
//
//  Created by Zack Liam and Lucas on 2022-05-16.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseCore
import FirebaseStorage

class EventViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var db = Firestore.firestore()
    var users = [User]()
   
    
    override func viewDidLoad() {
        
        
        self.db.collection("users").whereField("idd", isEqualTo: 1).addSnapshotListener { (querySnapshot, error) in
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
                
                self.label.text = Title
                
                return User(Title: Title, Body: Body, Lines: Lines, idd: idd)
            }
        }
    }
}


