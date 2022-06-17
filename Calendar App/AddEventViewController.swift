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
        self.locationTextField.delegate = self
        self.descriptionTextField.delegate = self
        //Preparing view visuals
        backgroundView.layer.cornerRadius = 10
        //Preparing button visuals
        createEventButton.layer.borderWidth = 4
        createEventButton.layer.borderColor = CGColor(red: 113/255, green: 92/255, blue: 131/255, alpha: 1)
        createEventButton.layer.cornerRadius = 10
        cancelButton.layer.borderWidth = 2
        cancelButton.layer.borderColor = CGColor(red: 219/255, green: 233/255, blue: 229/255, alpha: 1)
        cancelButton.layer.cornerRadius = 10
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
        else if whichTextBox == 4 {
            return groupClubTextField.resignFirstResponder()
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
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var groupClubTextField: UITextField!
    public var eventIdentification : Int = 1
    public var whichTextBox : Int = 0
    public var eventTitle : String = ""
    public var group : String = ""
    public var allDayEvent : Bool = false
    public var startEventYear : Int = 0
    public var startEventMonth : Int = 0
    public var startEventDay : Int = 0
    public var startEventHour : Int = 0
    public var startEventMinute : Int = 0
    public var startEventPeriod : Int = -1
    public var endEventYear : Int = 0
    public var endEventMonth : Int = 0
    public var endEventDay : Int = 0
    public var endEventHour : Int = 0
    public var endEventMinute : Int = 0
    public var endEventPeriod : Int = -1
    public var eventLocation : String = ""
    public var eventDescription : String = ""
    
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
    @IBAction func assignClub(_ sender: Any) {
        group = groupClubTextField.text!
        whichTextBox = 4
    }
    
    //all day switch
    var switchState : Bool = false
    @IBAction func allDayEventCreated(_ sender: Any) {
        if switchState == false {
            allDayEvent = true
            switchState = true
            startTimePicker.isHidden = true
            endTimePicker.isHidden = true
            startEventHour = 12
            startEventMinute = 01
            startEventPeriod = 0
            endEventHour = 11
            endEventMinute = 59
            endEventPeriod = 1
        }
        else if switchState == true{
            allDayEvent = false
            switchState = false
            startTimePicker.isHidden = false
            endTimePicker.isHidden = false
        }
    }
    
    //getting start time and date
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
        var datePart = 1
        for element in placeholderDate {
            if datePart == 1 && element != "/" {
                month+=String(element)
            }
            else if datePart == 2 && element != "/" {
                day+=String(element)
            }
            else if datePart == 3 && element != "/" {
                year+=String(element)
            }
            else if element == "/" && datePart > 0 {
                datePart+=1
            }
        }
        startEventMonth = Int(month)!
        startEventDay = Int(day)!
        startEventYear = 2000 + (Int(year)!)
        

    }
    
    @IBAction func getStartTime(_ sender: Any) {
        let getTime = startTimePicker.date
        var placeholderTime : String = ""
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        placeholderTime = formatter.string(from: getTime)
        var hours : String = ""
        var minutes : String = ""
        var minutesAndPeriod = ""
        var period : Int = -1
        var timePart = 1
        
        if switchState == false {
        for element in placeholderTime {
            if timePart == 1 && element != ":" {
                hours+=String(element)
            }
            else if timePart == 2 && element != ":" {
                minutesAndPeriod+=String(element)
            }
            else if element == ":" && timePart > 0 {
                timePart+=1
            }
        }
        var index : Int = 0
        for element in minutesAndPeriod {
            if index < 2 {
                minutes+=String(element)
            }
            else if index > 2 {
                if element == "A" {
                    period = 0
                    break
                }
                else {
                    period = 1
                    break
                }
            }
            index+=1
        }
        }
        startEventHour = Int(hours)!
        startEventMinute = Int(minutes)!
        startEventPeriod = period
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
        var datePart = 1
        for element in placeholderDate {
            if datePart == 1 && element != "/" {
                month+=String(element)
            }
            else if datePart == 2 && element != "/" {
                day+=String(element)
            }
            else if datePart == 3 && element != "/" {
                year+=String(element)
            }
            else if element == "/" && datePart > 0 {
                datePart+=1
            }
        }
        endEventMonth = Int(month)!
        endEventDay = Int(day)!
        endEventYear = 2000 + Int(year)!
    }
    
    @IBAction func getEndTime(_ sender: Any) {
        let getTime = endTimePicker.date
        var placeholderTime : String = ""
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        placeholderTime = formatter.string(from: getTime)
        var hours : String = ""
        var minutes : String = ""
        var minutesAndPeriod = ""
        var period : Int = -1
        var timePart = 1
        
        if switchState == false {
        for element in placeholderTime {
            if timePart == 1 && element != ":" {
                hours+=String(element)
            }
            else if timePart == 2 && element != ":" {
                minutesAndPeriod+=String(element)
            }
            else if element == ":" && timePart > 0 {
                timePart+=1
            }
        }
        var index : Int = 0
        for element in minutesAndPeriod {
            if index < 2 {
                minutes+=String(element)
            }
            else if index > 2 {
                if element == "A" {
                    period = 0
                    break
                }
                else {
                    period = 1
                    break
                }
            }
            index+=1
        }
        }
        endEventHour = Int(hours)!
        endEventMinute = Int(minutes)!
        endEventPeriod = period
    }

    //creating instance of class
    @IBAction func createClass(_ sender: Any) {
        if eventTitle == "" {
            errorMessageLabel.text = "no event title"
        }
        else if eventLocation == "" {
            errorMessageLabel.text = "no event location"
        }
        else if eventDescription == "" {
            errorMessageLabel.text = "no event description"
        }
        else if group == "" {
            errorMessageLabel.text = "no group attached"
        }
        else if startEventHour == endEventHour && startEventMinute == endEventMinute && startEventDay == endEventDay && startEventMonth == endEventMonth {
            errorMessageLabel.text = "event cannot start and end at same time"
        }
        else {
        let startEventDate = ICSDate (year : startEventYear , month : startEventMonth , day : startEventDay)
        let startEventTime = ICSTime (hour: startEventHour, minute: startEventMinute, period: startEventPeriod)
        let endEventDate = ICSDate (year : endEventYear , month : endEventMonth , day : endEventDay)
        let endEventTime = ICSTime (hour: endEventHour, minute: endEventMinute, period: endEventPeriod)
            let event = ICSEvent (name : eventTitle , description: eventDescription , location: eventLocation , group : group , startDate: startEventDate , endDate : endEventDate, startTime : startEventTime , endTime : endEventTime , id : eventIdentification)
            
            print("yes it is working")
            add(startEventMonth : startEventDate.getMonth(), startEventDay : startEventDate.getDay(), startEventYear : startEventDate.getYear(), startEventHour : startEventTime.getHour(), startEventMinute : startEventTime.getMinute(), endEventMonth : endEventDate.getMonth(), endEventDay : endEventDate.getDay(), endEventYear : endEventDate.getYear(), endEventHour : endEventTime.getHour(), endEventMinute : endEventTime.getMinute(), event: event)
            
            
        eventIdentification+=1
        performSegue(withIdentifier: "GenerateSegue", sender: event)
        }
    }
    
}


