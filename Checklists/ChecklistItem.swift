//
//  ChecklistItem.swift
//  Checklists
//
//  Created by MyMacbook on 1/26/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import Foundation
import UIKit

class ChecklistItem: NSObject, NSCoding {
    // inheritance of NSObject is necessary to do ChecklistItem Equatable to enable method indexOf in delegate's method of CheckListViewController
    //NSCoding is needed here to say compiler how to encode class variables in CheckListViewController.saveChecklistItem()
    var text = ""
    var checked = false
    var dueDate = NSDate()
    var shouldRemind = false
    var itemID: Int
    
    func toggleChecked() {
        checked = !checked
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
        aCoder.encodeObject(dueDate, forKey: "DueDate")
        aCoder.encodeBool(shouldRemind, forKey: "ShouldRemind")
        aCoder.encodeInteger(itemID, forKey: "ItemID")
    }
    
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey("Text") as! String
        checked = aDecoder.decodeBoolForKey("Checked")
        dueDate = aDecoder.decodeObjectForKey("DueDate") as! NSDate
        shouldRemind = aDecoder.decodeBoolForKey("ShouldRemind")
        itemID = aDecoder.decodeIntegerForKey("ItemID")
                super.init()
    }
    
    override init() {
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
    
    func scheduleNotification() {
        let existingNotification = notificationForThisItem()
        if let notification = existingNotification {
            print("Found an existing notification \(notification)")
            UIApplication.sharedApplication().cancelLocalNotification(
            notification)
        }
        if shouldRemind && dueDate.compare(NSDate()) != .OrderedAscending {
            //This compares the due date on the item with the current date.
        let localNotification = UILocalNotification()
        localNotification.fireDate = dueDate
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.alertBody = text
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.userInfo = ["ItemID": itemID]
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
        print("Scheduled notification! \(localNotification) for itemID\(itemID)")
        }
    }
    
    func notificationForThisItem() -> UILocalNotification? {
            let allNotifications =
            UIApplication.sharedApplication().scheduledLocalNotifications!
            for notification in allNotifications {
            if let number = notification.userInfo?["ItemID"] as? Int
            where number == itemID {
        return notification
            }
        }
            return nil
    }
    
    deinit {
                if let notification = notificationForThisItem() {
                print("Removing existing notification \(notification)")//all print statements in the app are for debug purpose
                UIApplication.sharedApplication().cancelLocalNotification(notification)
                }
    }
    
}

