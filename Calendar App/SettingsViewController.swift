//
//  SettingsViewController.swift
//  Calendar App
//
//  Created by Zack Liam and Lucas on 2022-05-16.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logoutButton.layer.borderWidth = 4
        logoutButton.layer.borderColor = CGColor(red: 113/225, green: 92/225, blue: 131/225, alpha: 1)
        logoutButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    

  

}
