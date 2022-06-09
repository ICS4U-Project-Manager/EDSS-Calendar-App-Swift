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

class ClientDataViewController: UIViewController {
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var attorneyLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var uidLabel: UILabel!
    
    let id = Auth.auth().currentUser!.uid
    let email = Auth.auth().currentUser!.email
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.uidLabel.text = id
        self.emailLabel.text = email
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // call super
        
        getName { (name) in
            if let name = name {
                self.firstNameLabel.text = name
                print("great success")
            }
        }
    }
    
    // MARK: Methods
    
    func getName(completion: @escaping (_ name: String?) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { // safely unwrap the uid; avoid force unwrapping with !
            completion(nil) // user is not logged in; return nil
            return
        }
        Firestore.firestore().collection("users").document(uid).getDocument { (docSnapshot, error) in
            if let doc = docSnapshot {
                if let name = doc.get("firstName") as? String {
                    completion(name) // success; return name
                } else {
                    print("error getting field")
                    completion(nil) // error getting field; return nil
                }
            } else {
                if let error = error {
                    print(error)
                }
                completion(nil) // error getting document; return nil
            }
        }
    }
}



