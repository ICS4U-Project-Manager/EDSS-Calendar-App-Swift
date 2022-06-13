//Calendar App Time Class
//Ethan Warren
//05/31/2022
//ICS4UI

import Foundation

class ICSTime {
    private var hour:Int
    private var minute:Int
    private var period:Int
    
    init(time:Int,isCyclic:Bool) {
        if isCyclic {
            if time > 720 {
                self.period=1
            }
            else {
                self.period=0
            }
            self.hour=Int(floor(Double(time)/60.0))%12
            self.minute=time-self.period*720-self.hour*60
        }
        else {
            self.period = -1
            self.hour=Int(floor(Double(time)/60.0))
            self.minute=time-self.hour*60
        }
    }
    
    init(hour:Int,minute:Int,period:Int) {
        self.period=period%2
        self.hour=hour%12
        self.minute=minute%60
    }
    
    func getRaw() -> Int {
        if self.period < 0 {
            return self.hour*60+self.minute
        }
        else {
            return self.period*720+self.hour*60+self.minute
        }
    }
    
    func getHour() -> Int {
        if self.hour == 0 {
            return 12
        }
        else {
            return self.hour
        }
    }
    
    func setHour(_ hour:Int) {
        if self.period < 0 {
            self.hour=hour
        }
        else {
            self.hour=hour%12
        }
    }
    
    func getMinute() -> Int {
        return self.minute
    }
    
    func setMinute(_ minute:Int) {
        if self.period < 0 {
            self.minute=minute
        }
        else {
            self.minute=minute%60
        }
    }
    
    func getPeriod() -> Int {
        return self.period
    }
    
    func setPeriod(_ period:Int) {
        self.period=period%2
    }
    
    func getText() -> String {
        let when=[-1:"",0:"AM",1:"PM"][self.period]!
        var formatHour="\(self.hour)"
        if self.hour == 0 {
        formatHour="12"
    }
        var formatMinute="\(self.minute)"
        if self.minute == 0 {
            formatMinute="00"
        }
        return "\(formatHour):\(formatMinute) \(when)"
    }
}
