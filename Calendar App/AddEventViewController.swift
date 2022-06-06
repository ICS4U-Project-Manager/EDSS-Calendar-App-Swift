//
//  AddEventViewController.swift
//  Calendar App
//
//  Created by Zack Liam and Lucas on 2022-05-16.
//

import UIKit

var eventIdentification : Int = 1

class AddEventViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        //Preparing keyboard exit
        self.titleTextField.delegate = self
        self.locationTextField.delegate = self
        self.descriptionTextField.delegate = self
        //Preparing view visuals
        backgroundView.layer.cornerRadius = 10
        //Preparing button visuals
        createEventButton.layer.borderWidth = 2
        createEventButton.layer.borderColor = CGColor(red: 113/255, green: 92/255, blue: 131/255, alpha: 1)
        cancelButton.layer.borderWidth = 2
        cancelButton.layer.borderColor = CGColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        cancelButton.layer.cornerRadius = 10
        createEventButton.layer.cornerRadius = 10
    //preparing date picker design
        
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
    //Start haptic engine
    let hapticsNotification = UINotificationFeedbackGenerator()
    //OUTLETS and VARIABLES
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var createEventButton: UIButton!
    @IBOutlet weak var allDaySwitch: UISwitch!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var startTimePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var endTimePicker: UIDatePicker!
    
    
    var whichTextBox : Int = 0
    var eventTitle : String = ""
    var allDayEvent : Bool = false
    var startEventYear : Int = 0
    var startEventMonth : Int = 0
    var startEventDay : Int = 0
    var startEventHour : Int = 0
    var startEventMinute : Int = 0
    var startEventPeriod : Int = -1
    var endEventYear : Int = 0
    var endEventMonth : Int = 0
    var endEventDay : Int = 0
    var endEventHour : Int = 0
    var endEventMinute : Int = 0
    var endEventPeriod : Int = -1
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
    
    //getting start time and date
    //REDO START TIME AND DATE FUNCTION BECAUSE OUTLET WAS CHANGED
    @IBAction func getStartDate(_ sender: Any) {
        //initializing date format
        let getDate = startDatePicker.date
        var placeholderDate : String = ""
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        placeholderDate = formatter.string(from: getDate)
        //reading date formatted string
        var month : String = ""
        var day : String = ""
        var year : String = ""
        var index = 0
        for element in placeholderDate {
            if index < 2 {
                month+=String(element)
            }
            else if 3 <= index && index < 5 {
                day+=String(element)
            }
            else if 6 <= index && index <= 7 {
                year+=String(element)
            }
            else {
                //it will be the slash so skip
            }
            index+=1
        }
        //startEventMonth = Int(month)!
        //startEventDay = Int(day)!
        //startEventYear = Int(year)!
        print(month)
        print(day)
        print(year)
        //print(startEventMonth)
        //print(startEventDay)
        //print(startEventYear)
    }
    
    @IBAction func getStartTime(_ sender: Any) {
        let getTime = startTimePicker.date
        var placeholderTime : String = ""
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        placeholderTime = formatter.string(from: getTime)
        print(placeholderTime)
    }
    
    //getting end time and date
    @IBAction func getEndDate(_ sender: Any) {
        //get date formatted
        let getDate = endDatePicker.date
        var placeholderDate : String = ""
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        placeholderDate = formatter.string(from: getDate)
        //reading date formatted string
        var month : String = ""
        var day : String = ""
        var year : String = ""
        var index = 0
        for element in placeholderDate {
            if index < 2 {
                month+=String(element)
            }
            else if 3 <= index && index < 5 {
                day+=String(element)
            }
            else if 6 <= index && index <= 7 {
                year+=String(element)
            }
            else {
                //it will be the slash so skip
            }
            index+=1
        }
        endEventMonth = Int(month)!
        endEventDay = Int(day)!
        endEventYear = Int(year)!
        print(endEventMonth)
        print(endEventDay)
        print(endEventYear)
    }
    
    @IBAction func getEndTime(_ sender: Any) {
        let getTime = endTimePicker.date
        var placeholderTime : String = ""
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        placeholderTime = formatter.string(from: getTime)
        print(placeholderTime)
    }
    
    //creating instance of class
    @IBAction func createClass(_ sender: Any) {
        //let event = Event(name: titleTextField.text!, description: descriptionTextField.text!, location: locationTextField.text!, start: 1, end: 1, group: "placeholder")
    }
}


