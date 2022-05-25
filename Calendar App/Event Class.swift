//Calendar App Event Class
//Ethan Warren
//05/20/2022
//ICS4UI

class Event {
    private var name:String
    private var description:String
    private var location:String
    private var group:String?
    private var start:Int
    private var end:Int
    private var duration:Int { return end-start}

    init(name:String, description:String, location:String, start:Int, end:Int, group:String) {
        self.group=group
        self.name=name
        self.description=description
        self.location=location
        self.start=start
        self.end=end
    }

    init(name:String, description:String, location:String, start:Int, end:Int) {
        self.group=nil
        self.name=name
        self.description=description
        self.location=location
        self.start=start
        self.end=end
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

    func getStart() -> Int {
        return self.start
    }

    func setStart(_ start:Int) {
        self.start=start
    }

    func getEnd() -> Int {
        return self.end
    }

    func setEnd(_ end:Int) {
        self.end=end
    }

    func getDuration() -> Int {
        return self.duration
    }
}