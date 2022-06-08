//Calendar App Date Class
//Ethan Warren
//05/26/2022
//ICS4UI

import Foundation

class ICSDate {
    private var year:Int
    private var month:Int
    private var day:Int
    private let months =
        ["January":1,"February":2,"March":3,"April":4,"May":5,"June":6,"July":7,"August":8,"September":9,"October":10,"November":11,"December":12]
    private let nums=[1,4,4,0,2,5,0,3,6,1,4,6]
    private let days=[1:"Sunday",2:"Monday",3:"Tuesday",4:"Wednesday",5:"Thursday",6:"Friday",7:"Saturday"]
    init(year:Int,month:Int,day:Int) {
        self.year=year
        if month > 12 {
            self.month=month%12
        }
        else if month < 1 {
            self.month=1
        }
        else {
            self.month=month
        }
        self.day=day
    }
    init(year:Int,month:String,day:Int) {
        self.year=year
        self.month=self.months[month]!
        self.day=day
    }
    func getYear() -> Int {
        return self.year
    }
    func setYear(_ year:Int) {
        self.year=year
    }
    func getMonth() -> Int {
        return self.month
    }
    func setMonth(_ month:Int) {
        self.month=month
    }
    func getMonthSTR() -> String {
        for (key,value) in self.months {
            if self.month == value {
                return key
            }
        }
        return ""
    }
    func setMonthSTR(_ month:String) {
        self.month=self.months[month]!
    }
    func getDay() -> Int {
        return self.day
    }
    func setDay(_ day:Int) {
        self.day=day
    }
    func getDaySTR() -> String {
        var result=Int(floor((Double(self.year%100))/4.0))+self.day+self.nums[self.month-1]
        if (result%4 == 0) && ((1...2).contains(self.month)) {
            result-=1
        }
        result+=[6,4,2,0][Int(floor(Double(self.year)/100.0))%4]
        result+=self.year%100
        if result%7 == 0 {
            return self.days[7]!
        }
        else {
            return self.days[result%7]!
        }
    }
    func getText() -> String {
        return "\(self.getDaySTR()), \(self.getMonthSTR()) \(self.getDay()), \(self.getYear())"
    }
}
