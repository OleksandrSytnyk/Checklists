//
//  ViewController.swift
//  Checklists
//
//  Created by MyMacbook on 1/24/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var row0text = "Walk the dog"
    var row1text = "Brush teeth"
    var row2text = "Learn iOS development"
    var row3text = "Soccer practice"
    var row4text = "Eat ice cream"
    var row0checked = false
    var row1checked = false
    var row2checked = false
    var row3checked = false
    var row4checked = false
//These ten instance variables are the data model.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier( "ChecklistItem", forIndexPath: indexPath)
            let label = cell.viewWithTag(1000) as! UILabel
            //Here you ask the table view cell for the view with tag 1000. That is the tag you set on the label in the storyboard, so this returns a reference to the corresponding UILabel object.
            if indexPath.row == 0 {
                //This uses the remainder operator, represented by the % sign
                label.text = row0text
            } else if indexPath.row == 1 {
                label.text = row1text
            } else if indexPath.row == 2 {
                label.text = row2text
            } else if indexPath.row == 3 {
                label.text = row3text
            } else if indexPath.row == 4 {
                label.text = row4text
            }
        configureCheckmarkForCell(cell, indexPath: indexPath)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
                if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                    //The checkmark is part of the cell (the accessory, remember?), so you first need to find the UITableViewCell object for the tapped row.
                    //this is not the same method as the data source method tableView(cellForRowAtIndexPath).
                    //Because it is theoretically possible that there is no cell at the specified index-path,for example if that row isn’t visible, you need to use the special if let statement.
                var isChecked = false
                if indexPath.row == 0 {
                row0checked = !row0checked
                isChecked = row0checked
            } else if indexPath.row == 1 {
                row1checked = !row1checked
                isChecked = row1checked
            } else if indexPath.row == 2 {
                row2checked = !row2checked
                isChecked = row2checked
            } else if indexPath.row == 3 {
                row3checked = !row3checked
                isChecked = row3checked
            } else if indexPath.row == 4 {
                row4checked = !row4checked
                isChecked = row4checked
                }
                
                if isChecked {
            cell.accessoryType = .Checkmark
                } else {
            cell.accessoryType = .None
                }
            }
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func configureCheckmarkForCell(cell: UITableViewCell, indexPath: NSIndexPath) {
                    var isChecked = false
                    if indexPath.row == 0 {
                    isChecked = row0checked
                } else if indexPath.row == 1 {
                    isChecked = row1checked
                } else if indexPath.row == 2 {
                    isChecked = row2checked
                } else if indexPath.row == 3 {
                    isChecked = row3checked
                } else if indexPath.row == 4 {
                    isChecked = row4checked
                    }
                    if isChecked {
                    cell.accessoryType = .Checkmark
                    } else {
                    cell.accessoryType = .None
                }
    }
    
}

