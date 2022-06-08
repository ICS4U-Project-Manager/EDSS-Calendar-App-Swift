//Calendar App Event Class
//Ethan Warren
//05/20/2022
//ICS4UI


class ICSEvent {
    private var name:String
    private var description:String
    private var location:String
    private var group:String?
    private var startDate:ICSDate
    private var endDate:ICSDate
    private var startTime:ICSTime
    private var endTime:ICSTime
    private var duration:ICSTime {
        return ICSTime(time:endTime.getRaw()-startTime.getRaw(),isCyclic:false)
    }
    private var id:Int=0
    init(name:String, description:String, location:String, group:String, startDate:ICSDate, endDate:ICSDate, startTime:ICSTime, endTime:ICSTime, id:Int) {
        self.group=group
        self.name=name
        self.description=description
        self.location=location
        self.startDate=startDate
        self.endDate=endDate
        self.startTime=startTime
        self.endTime=endTime
        self.id=id
    }
    init(name:String, description:String, location:String, startDate:ICSDate, endDate:ICSDate, startTime:ICSTime, endTime:ICSTime, id:Int) {
        self.group=nil
        self.name=name
        self.description=description
        self.location=location
        self.startDate=startDate
        self.endDate=endDate
        self.startTime=startTime
        self.endTime=endTime
        self.id=id
    }
    func getName() -> String {
        return self.name
    }
    func setName(_ name:String) {
        self.name=name
    }
    func getDescription() -> String {
        return self.description
    }
    func setDescription(_ description:String) {
        self.description=description
    }
    func getLocation() -> String {
        return self.location
    }
    func setLocation(_ location:String) {
        self.location=location
    }
    func getGroup() -> String {
        if self.group ?? nil == nil {
            return ""
        }
        else {
            return self.group!
        }
    }
    func setGroup(_ group:String) {
        self.group=group
    }
    func getStartDate() -> ICSDate {
        return self.startDate
    }
    func setStartDate(_ startDate:ICSDate) {
        self.startDate=startDate
    }
    func getEndDate() -> ICSDate {
        return self.endDate
    }
    func setEndDate(_ endDate:ICSDate) {
        self.endDate=endDate
    }
    func getStartTime() -> ICSTime {
        return self.startTime
    }
    func setStartTime(_ startTime:ICSTime) {
        self.startTime=startTime
    }
    func getEndTime() -> ICSTime {
        return self.endTime
    }
    func setEndTime(_ endTime:ICSTime) {
        self.endTime=endTime
    }
    func getDuration() -> ICSTime {
        return self.duration
    }
    func getId() -> Int {
        return self.id
    }
    func setId(_ id:Int) {
        self.id=id
    }
}
