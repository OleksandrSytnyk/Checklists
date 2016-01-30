//
//  ChecklistItem.swift
//  Checklists
//
//  Created by MyMacbook on 1/26/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    // inheritance of NSObject is necessary to do ChecklistItem Equatable to enable method indexOf in delegate's method of CheckListViewController
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}

