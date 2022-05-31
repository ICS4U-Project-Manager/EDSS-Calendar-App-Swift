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
        
        //Preparing view visuals
        backgroundView.layer.cornerRadius = 10
        //Preparing button visuals
        createEventButton.layer.borderWidth = 2
        createEventButton.layer.borderColor = CGColor(red: 113/255, green: 92/255, blue: 131/255, alpha: 1)
        cancelButton.layer.borderWidth = 2
        cancelButton.layer.borderColor = CGColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        cancelButton.layer.cornerRadius = 10
        createEventButton.layer.cornerRadius = 10
    //preparing switch design
        
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
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var createEventButton: UIButton!
    @IBOutlet weak var allDaySwitch: UISwitch!
    
    var whichTextBox : Int = 0
    var eventTitle : String = ""
    var allDayEvent : Bool = false
    var eventLocation : String = ""
    var eventDescription : String = ""
    
    //FUNCTIONS
    //reading text boxes
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
    
    //all day switch
    var switchState : Bool = false
    @IBAction func allDayEventCreated(_ sender: Any) {
        if switchState == false {
            allDayEvent = true
            switchState = true
        }
        else if switchState == true{
            allDayEvent = false
            switchState = false
        }
    }
    
    //creating instance of class
    @IBAction func createClass(_ sender: Any) {
        
    }
    
    
}


