//
//  SigninViewController.swift
//  Calendar App
//
//  Created by Zack Liam and Lucas on 2022-05-13.
//

import UIKit

class SigninViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

    @IBOutlet weak var Firestore: UILabel!
    func someFunction() {
            self.Firestore.text = "text"
        }
    
    @IBAction func LogOutUnwind(_ sender: UIStoryboardSegue) {}
    
}
