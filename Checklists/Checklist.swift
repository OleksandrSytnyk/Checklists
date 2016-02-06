//
//  Checklist.swift
//  Checklists
//
//  Created by MyMacbook on 2/1/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {
    var name = ""
    var items = [ChecklistItem]()
    var iconName: String
    
    convenience init(name: String) {
        self.init( name: name, iconName: "No Icon")
    }
    //it's a convenience initializer because it farms out its work to another init method. In this case init(name, iconName) has become the so-called designated initializer
    
    init(name: String, iconName: String) {
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        items = aDecoder.decodeObjectForKey("Items") as! [ChecklistItem]
        iconName = aDecoder.decodeObjectForKey("IconName") as! String
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(items, forKey: "Items")
        aCoder.encodeObject(iconName, forKey: "IconName")
    }
    
    func countUncheckedItems() -> Int {
    var count = 0
    for item in items where !item.checked {
    count += 1
    }
    return count
    }

   /*
    // The functional programming version
    func countUncheckedItems() -> Int {
    return items.reduce(0) { cnt, item in cnt + (item.checked ? 0 : 1) }
    }
   */    
}
