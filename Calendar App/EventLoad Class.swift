//Calendar app data helper functions
//Ethan Warren
//06/07/2022
//ICS4UI

import Foundation

func ICSEventLoad(_ events:[[String:Any]]) -> [ICSEvent] {
    var result:[ICSEvent]=[]
    for event in events {
        let name=event["name"]! as! String
        let description=event["description"]! as! String
        let location=event["location"]! as! String
        let group=event["group"]! as! String
        let id=event["id"]! as! Int
        let startYear=event["startYear"]! as! Int
        let startMonth=event["startMonth"]! as! Int
        let startDay=event["startDay"]! as! Int
        let endYear=event["endYear"]! as! Int
        let endMonth=event["endMonth"]! as! Int
        let endDay=event["endDay"]! as! Int
        let startHour=event["startHour"]! as! Int
        let startMinute=event["startMinute"]! as! Int
        let startPeriod=event["startPeriod"]! as! Int
        let endHour=event["endHour"]! as! Int
        let endMinute=event["endMinute"]! as! Int
        let endPeriod=event["endPeriod"]! as! Int
        let startDate:ICSDate=ICSDate(year:startYear,month:startMonth,day:startDay)
        let endDate:ICSDate=ICSDate(year:endYear,month:endMonth,day:endDay)
        let startTime:ICSTime=ICSTime(hour:startHour,minute:startMinute,period:startPeriod)
        let endTime:ICSTime=ICSTime(hour:endHour,minute:endMinute,period:endPeriod)
        result.append(ICSEvent(name:name,description:description,location:location,group:group,startDate:startDate,endDate:endDate,startTime:startTime,endTime:endTime,id:id))
    }
    return result
}
