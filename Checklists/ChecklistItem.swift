//
//  ChecklistItem.swift
//  Checklists
//
//  Created by MyMacbook on 1/26/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}

