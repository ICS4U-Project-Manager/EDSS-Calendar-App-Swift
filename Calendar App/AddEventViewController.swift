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
    
        //Preparing keyboard exit
        self.titleTextField.delegate = self
    }
    
    //Keyboard Dissapear Functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if whichTextBox == 1 {
        return titleTextField.resignFirstResponder()
        }
        else if whichTextBox == 2 {
           return locationTextField.resignFirstResponder()
        }
        else if whichTextBox == 3 {
            return descriptionTextField.resignFirstResponder()
        }
        return false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //OUTLETS and VARIABLES
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var whichTextBox : Int = 0
    var eventTitle : String = ""
    var eventLocation : String = ""
    var eventDescription : String = ""
    
    //functions
    @IBAction func assignEventTitle(_ sender: Any) {
        eventTitle = titleTextField.text!
        whichTextBox = 1
    }
    @IBAction func assignEventLocation(_ sender: Any) {
        eventLocation = locationTextField.text!
        whichTextBox = 2
    }
    @IBAction func assignEventDescription(_ sender: Any) {
        eventDescription = descriptionTextField.text!
        whichTextBox = 3
    }
    
    
}


