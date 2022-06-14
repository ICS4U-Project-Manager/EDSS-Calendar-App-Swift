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
    
    var viewModel = userViewModel()
    var event : ICSEvent?
    
    override func viewDidLoad() {
        label.text = "user.Title"
        if let label:String = event?.getName() {
        classLabel.text = label
        }
        else {
            classLabel.text = "event not found"
        }
    }
    
    @IBOutlet weak var classLabel: UILabel!
    
}

