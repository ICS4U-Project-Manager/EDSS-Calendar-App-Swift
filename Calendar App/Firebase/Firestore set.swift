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

var coun = 0

func add(){
    var id : String?
    var name = "String"
    var first = "String"
    
    coun += 2
var person = [
                "first": first,
                "name": name,
                "website": coun
] as [String : Any]


var db = Firestore.firestore()

func addBook() {
    do {
        let _ = try db.collection("books").addDocument(data: person)
    }
    catch {
      print(error)
    }
  }
}
