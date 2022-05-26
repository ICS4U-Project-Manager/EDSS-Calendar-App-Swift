//
//  AddEventViewController.swift
//  Calendar App
//
//  Created by Zack Liam and Lucas on 2022-05-16.
//

import UIKit

class AddEventViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = CGColor(red: 113/255, green: 92/255, blue: 131/255, alpha: 1)
        //preparing text field to be able to exit keyboard
        self.titleTextField.delegate = self
    }
    //OUTLETS
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!

    //KEYBOARD FUNCTIONS
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return titleTextField.resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //CLASS PROPERTY VARIABLES
    var nameOfEvent : String = ""
    //var allDayEvent : Bool
    //var startTime
    //var endTime
    var locationOfEvent : String = ""
    var descriptionOfEvent : String = ""
    //var clubOrGroup : String
    
    //ASSIGNING VALUES
    //title
    @IBAction func assignEventName(_ sender: Any) {
        nameOfEvent = titleTextField.text!
    }
    //location
    @IBAction func assignEventLocation(_ sender: Any) {
        locationOfEvent = locationTextField.text!
    }
    //description
    @IBAction func assignEventDescription(_ sender: Any) {
        descriptionOfEvent = descriptionTextField.text!
    }
    
}


