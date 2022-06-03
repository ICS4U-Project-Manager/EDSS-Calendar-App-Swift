//Calendar App Event Class
//Ethan Warren
//05/20/2022
//ICS4UI
import Foundation

class Event {
    private var name:String
    private var description:String
    private var location:String
    private var group:String?
    private var date:Date
    private var start:Time
    private var end:Time
    private var duration:Time {
        return Time(time:end.getRaw()-start.getRaw(),isCyclic:false)
    }
    private var id:Int=0

    init(name:String, description:String, location:String, group:String, date:Date, start:Time, end:Time, id:Int) {
        self.group=group
        self.name=name
        self.description=description
        self.location=location
        self.date=date
        self.start=start
        self.end=end
        self.id=id
    }

    init(name:String, description:String, location:String, date:Date, start:Time, end:Time, id:Int) {
        self.group=nil
        self.name=name
        self.description=description
        self.location=location
        self.date=date
        self.start=start
        self.end=end
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

    func getDate() -> Date {
        return self.date
    }

    func setDate(_ date:Date) {
        self.date=date
    }

    func getStart() -> Time {
        return self.start
    }

    func setStart(_ start:Time) {
        self.start=start
    }

    func getEnd() -> Time {
        return self.end
    }

    func setEnd(_ end:Time) {
        self.end=end
    }

    func getDuration() -> Time {
        return self.duration
    }
    func getId() -> Int {
        return self.id
    }
    func setId(_ id:Int) {
        self.id=id
    }
}
