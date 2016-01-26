//
//  ViewController.swift
//  Checklists
//
//  Created by MyMacbook on 1/24/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var items: [ChecklistItem]
    //These five instance variables are the data model.
    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        let row0item = ChecklistItem()
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item)
        let row1item = ChecklistItem()
        row1item.text = "Brush my teeth"
        row1item.checked = true
        items.append(row1item)
        let row2item = ChecklistItem()
        row2item.text = "Learn iOS development"
        row2item.checked = true
        items.append(row2item)
        let row3item = ChecklistItem()
        row3item.text = "Soccer practice"
        row3item.checked = false
        items.append(row3item)
        let row4item = ChecklistItem()
        row4item.text = "Eat ice cream"
        row4item.checked = true
        items.append(row4item)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier( "ChecklistItem", forIndexPath: indexPath)
            let item = items[indexPath.row]
            let label = cell.viewWithTag(1000) as! UILabel
            //Here you ask the table view cell for the view with tag 1000. That is the tag you set on the label in the storyboard, so this returns a reference to the corresponding UILabel object.
            label.text = item.text
        configureCheckmarkForCell(cell, indexPath: indexPath)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
                if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                    //The checkmark is part of the cell (the accessory, remember?), so you first need to find the UITableViewCell object for the tapped row.
                    //this is not the same method as the data source method tableView(cellForRowAtIndexPath).
                    //Because it is theoretically possible that there is no cell at the specified index-path,for example if that row isn’t visible, you need to use the special if let statement.
                let item = items[indexPath.row]
                    item.checked = !item.checked
               configureCheckmarkForCell(cell, indexPath: indexPath)
            }
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func configureCheckmarkForCell(cell: UITableViewCell, indexPath: NSIndexPath) {
                   let item = items[indexPath.row]
                    if item.checked {
                    cell.accessoryType = .Checkmark
                    } else {
                    cell.accessoryType = .None
                }
    }
    
}

