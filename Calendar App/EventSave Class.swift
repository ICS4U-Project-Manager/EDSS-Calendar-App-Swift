//Calendar app data helper functions
//Ethan Warren
//06/07/2022
//ICS4UI

import Foundation

func ICSEventSave(_ events:[ICSEvent]) -> [String:Any] {
    let result:[String:Any]=[:]
    for event in events {
        let eventDict:[String:Any]
        let name=event.getName()
        let description=event.getDescription()
        let location=event.getLocation()
        let group=event.getGroup()
        let id=event.getId()
        let startYear=event.getStartDate().getYear()
        let startMonth=event.getStartDate().getMonth()
        let startDay=event.getStartDate().getDay()
        let endYear=event.getEndDate().getYear()
        let endMonth=event.getEndDate().getMonth()
        let endDay=event.getEndDate().getDay()
        let startHour=event.getStartTime().getHour()
        let startMinute=event.getStartTime().getMinute()
        let startPeriod=event.getStartTime().getPeriod()
        let endHour=event.getEndTime().getHour()
        let endMinute=event.getEndTime().getMinute()
        let endPeriod=event.getEndTime().getPeriod()
        eventDict=["name":name,"description":description,"location":location,"group":group,"startYear":startYear,"startMonth":startMonth,"startDay":startDay,"endYear":endYear,"endMonth":endMonth,"endDay":endDay,"startHour":startHour,"startMinute":startMinute,"startPeriod":startPeriod,"endHour":endHour,"endMinute":endMinute,"endPeriod":endPeriod,"id":id]
    }
    return result
}
