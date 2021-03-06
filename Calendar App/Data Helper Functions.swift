//Calendar app data helper functions
//Ethan Warren
//06/07/2022
//ICS4UI

func ICSEventSave(_ events:[ICSEvent]) -> [[String:Any]] {
    var result:[[String:Any]]=[]
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
        result.append(eventDict)
    }
    return result
}

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


func ICSFilterEvents(groups:[String],events:[ICSEvent]) -> [ICSEvent] {
    var result:[ICSEvent]=[]
    for event in events {
        if groups.contains(event.getGroup()) {
            result.append(event)
        }
    }
    return result
}

func ICSEventSearch(term:String,events:[ICSEvent]) -> [ICSEvent] {
    var result:[ICSEvent]=[]
    for event in events {
        if event.getName().contains(term) || event.getDescription().contains(term) || event.getGroup().contains(term) || event.getGroup().contains(term) {
            result.append(event)
        }
    }
    return result
}
