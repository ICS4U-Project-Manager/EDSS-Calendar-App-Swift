//
//  Firestore List.swift
//  Calendar App
//
//  Created by Kyle Stirbet on 2022-05-24.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase
import SwiftUI

struct User: Identifiable {
    var id: String = UUID().uuidString
    var Title: String
    var Body: String
    var Lines: String
    var idd: Int
}

struct AddDate: Identifiable {
    var id: String = UUID().uuidString
    var date: String
}
