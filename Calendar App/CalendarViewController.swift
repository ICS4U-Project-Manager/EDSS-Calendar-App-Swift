//
//  CalendarViewController.swift
//  Calendar App
//
//  Created by Zack Liam and Lucas on 2022-05-16.
//

import UIKit
import Foundation
import Firebase
import FirebaseFirestore
import FirebaseCore
import FirebaseStorage


var count099 = 0
var cellnow = 1
var selectedDate = Date()
var dayNumString = String(dayNum)
var dayNum = Int()
var datew = Date()
var YearNumString = Date()
var cellnow2 = 1

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    var totalSquares = [String]()
    
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setCellsView()
        setMonthView()
    }
    
    
    func setCellsView()
    {
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2) / 8
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func setMonthView()
    {
        totalSquares.removeAll()
        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
        
        var count: Int = 1
        
        while(count <= 42)
        {
            if(count <= startingSpaces || count - startingSpaces > daysInMonth)
            {
                totalSquares.append(" ")
            }
            
            else
            {
                totalSquares.append(String(count - startingSpaces))
            }
            count += 1
        }
        
        monthLabel.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate)
        cellnow2 = 1
        cellnow = 1
        print("time has reset")
       
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let firstDayOfMonth1 = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpaces1 = CalendarHelper().weekDay(date: firstDayOfMonth1)
        
        dayNum = indexPath.row - startingSpaces1 + 1
        dayNumString = String(dayNum)
        print ("cell \(dayNum) clicked")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return totalSquares.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
        cell.backgroundColor = UIColor(named: "Dark green")
        cell.dayOfMonth.text = totalSquares[indexPath.item]
        print("\(CalendarHelper().monthString(date: selectedDate)) \(cellnow)")
        let firstDayOfMonth2 = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpaces2 = CalendarHelper().weekDay(date: firstDayOfMonth2)
        
        var cellnow3 = cellnow2 - 1
        
        if "\(CalendarHelper().monthString(date: selectedDate))" == "Sep"{
            cellnow3 += 1
        }
        
        
        if CalendarHelper().weekDay(date: firstDayOfMonth2) > cellnow {
            cellnow2 -= 1
            cellnow += 1
            print("ka \(cellnow)")
            print("ka2 \(cellnow2)")
        }
        else if CalendarHelper().weekDay(date: firstDayOfMonth2) <= cellnow {
            print(" rde \(CalendarHelper().monthString(date: selectedDate)) \(cellnow2)")
            var db = Firestore.firestore()
            db.collection("\(CalendarHelper().monthString(date: selectedDate)) \(cellnow3)").getDocuments() { [self] (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    print("No error getting documents")
                    let document = querySnapshot?.documents
                    let count098 = document!.count
                    print (count098)
                    print("ka \(cellnow)")
                    print("ka2 \(cellnow2)")
                    
                    if count098 == 0 {
                        print ("no doc")
                        print("ka \(cellnow)")
                        print("ka2 \(cellnow2)")
                        print(count098)
                        print("\(CalendarHelper().monthString(date: selectedDate)) \(cellnow2)")
                    
                    }
                    else {
                        print(count098)
                        print("\(CalendarHelper().monthString(date: selectedDate)) \(cellnow2)")
                        cell.backgroundColor = .systemPurple
                        
                        if "\(CalendarHelper().yearString(date: selectedDate))" == "2023"{
                            cell.backgroundColor = UIColor(named: "Dark green")
                        }
                        if "\(CalendarHelper().yearString(date: selectedDate))" == "2024"{
                            cell.backgroundColor = UIColor(named: "Dark green")
                        }
                        if "\(CalendarHelper().yearString(date: selectedDate))" == "2025"{
                            cell.backgroundColor = UIColor(named: "Dark green")
                        }
                        if "\(CalendarHelper().yearString(date: selectedDate))" == "2026"{
                            cell.backgroundColor = UIColor(named: "Dark green")
                        }
                    }
                }
            }
            cellnow2 += 1
        }
        
        cellnow += 1
       
        return cell
    }
    
    @IBAction func previousMonth(_ sender: Any)
    {
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        setMonthView()
    }
    
    @IBAction func nextMonth(_ sender: Any)
    {
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        setMonthView()
    }
    
    override open var shouldAutorotate: Bool
    {
        return false
    }
    
    @IBAction func PopUpDismiss(_ sender: UIStoryboardSegue) {
        
    }
    
    
}



class CalendarHelper
{
    let calendar = Calendar.current
    
    func plusMonth(date: Date) -> Date
    {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    func minusMonth(date: Date) -> Date
    {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    func monthString(date: Date) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLL"
        return dateFormatter.string(from: date)
    }
    
    func yearString(date: Date) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
    func daysInMonth(date: Date) -> Int
    {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    func dayOfMonth(date: Date) -> Int
    {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    func firstOfMonth(date: Date) -> Date
    {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    func weekDay(date: Date) -> Int
    {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
}

class CalendarCell: UICollectionViewCell
{
    @IBOutlet weak var dayOfMonth: UILabel!
}
