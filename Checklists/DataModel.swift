
import Foundation

class DataModel {
    var lists = [Checklist]()
    
    var indexOfSelectedChecklist: Int {
        get {
            return NSUserDefaults.standardUserDefaults().integerForKey("ChecklistIndex")
        }
        set {
            NSUserDefaults.standardUserDefaults().setInteger(newValue, forKey: "ChecklistIndex")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    init() {
        loadChecklists()
        registerDefault()
        handleFirstTime()
        print("Documents folder is \(documentsDirectory())")
    }
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths[0]
    }
    
    func dataFilePath() -> String {
        return (documentsDirectory() as NSString).stringByAppendingPathComponent("Checklists.plist")
    }
    
    func saveChecklists() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        //NSKeyedArchiver is a form of NSCoder that creates plist files
        archiver.encodeObject(lists, forKey: "Checklists")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    func loadChecklists() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                lists = unarchiver.decodeObjectForKey("Checklists")
                    as! [Checklist]
                unarchiver.finishDecoding() }
        }
    }
    
    func registerDefault() {
        let dictionary = ["ChecklistIndex": -1, "FirstTime": true]
        NSUserDefaults.standardUserDefaults().registerDefaults(dictionary)
    }
    //NSUserDefaults’s integerForKey() method returns 0 if it cannot find the value for the key you specify, but in this app 0 is a valid row index. At this point the app doesn’t have any checklists yet, so index 0 does not exist in the lists array. That is why the app crashes. Here we set a new default value -1. It's explanation for previous commit.
    
    func handleFirstTime() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let firstTime = userDefaults.boolForKey("FirstTime")
        if firstTime {
        let checklist = Checklist(name: "List")
        lists.append(checklist)
        indexOfSelectedChecklist = 0
        userDefaults.setBool(false, forKey: "FirstTime")
        userDefaults.synchronize()
        }
    }
}
