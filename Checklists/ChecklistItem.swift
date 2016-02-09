//
//  ChecklistItem.swift
//  Checklists
//
//  Created by MyMacbook on 1/26/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import Foundation

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
        aCoder.encodeObject(dueDate, forKey: "DieDate")
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
    //The init() is nedeed because there's init(coder) here
}

