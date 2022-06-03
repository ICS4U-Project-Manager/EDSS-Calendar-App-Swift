//
//  FilterViewController.swift
//  Calendar App
//
//  Created by Zack Liam and Lucas on 2022-05-16.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var exitPage: UIButton!
    @IBOutlet weak var applyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Prepare button visuals
        exitPage.layer.borderWidth = 2
        exitPage.layer.borderColor = CGColor(red: 165/255, green: 127/255, blue: 196/255, alpha: 1)
        exitPage.layer.cornerRadius = 10
        
        applyButton.layer.borderWidth = 4
        applyButton.layer.borderColor = CGColor(red: 113/255, green: 92/255, blue: 131/255, alpha: 1)
        applyButton.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    

  

}
