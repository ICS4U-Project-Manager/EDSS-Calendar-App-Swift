/*
 Calendar App Classes Documentation
 
 Ethan Warren
 ICS4UI
 
 
 ICSEvent
 
 Class which represents an event on the calendar
 
 init(name:String, description:String, location:String, group:String, startDate:ICSDate, endDate:ICSDate, startTime:ICSTime, endTime:ICSTime, id:Int) (group is optional)
 
 Properties:
 
 Methods:
 
 getName() -> String
     Returns the name of the event.
 
 setName(_ name:String)
     Sets the name of the event.
 All other getters and setters follow the same format. Also, getGroup returns an empty string if the group is not provided.
 
 getDuration() -> ICSTime
     Returns the computed duration of the event. Duration has no setter.
 Note that the returned duration is an ICSTime object with the "isCyclic" flag set to false (see ICSTime, below.)
 
 
 ICSDate
 
 Class which represents a date.
 
 init(year:Int,month:Int,day:Int)
 
 init(year:Int,month:String,day:Int) (Name of month must be the full name, and the first letter must be upper-case.)
 
 Properties:
 
 Methods:
 
 getYear() -> Int : Returns the year
 
 setYear(_ year:Int) : Sets the year to a new value.
 getMonth, getDay, setMonth, and setDay methods also exist, all taking or returning Ints.
 
 getMonthSTR, setMonthSTR, getDaySTr : Same as above, except that they take or return (as applicable) a string representing the day of the week or the name of the month (as applicable.)
 
 getText() -> String : Returns the date in a human readable format.
 
 
 ICSTime
 
 Class which represents a time.
 
 init(hour:Int,minute:Int,period:Int) (The period must be either 0 or 1, 0 for AM and 1 for PM.)
 
 init(time:Int,isCyclic:Bool) (This initializer is used internally by the event class, you will almost certainly never need to use it. Just know that the "duration" of the ICSEvent class uses this initializer, and is not constrained by AM and PM.)
 
 Properties:
 
 Methods:
 
 getHour, setHour, getMinute, setMinute, getPeriod, and setPeriod : Same as above.
 
 getText() -> String : Returns the time in standard human-readable time format.
 
 ICSEventSave(_ events:[ICSEvent]) -> [[String:Any]]
 Returns a list of dictionaries representing the event objects in a format which can be stored as json.
 
 ICSEventLoad(_ events:[[String:Any]]) -> [ICSEvent]
 Converts a list of dictionaries (retrieved from a json file) and converts it into a list of ICSEvent objects for use in the app.
 
 ICSFilterEvents(groups:[String],events:[ICSEvent]) -> [ICSEvent]
 Allows the filtering of the event list by group. Returns a list of events associated with any of the given groups.
 
 ICSEventSearch(term:String,events:[ICSEvent]) -> [ICSEvent]
 Returns a list of all events in the events parameter which contain the string term in any of the following:
 name,
 description,
 location,
 group.
 */
