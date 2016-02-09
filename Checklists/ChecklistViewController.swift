//
//  ViewController.swift
//  Checklists
//
//  Created by MyMacbook on 1/24/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, ItemDetailViewControllerDelegate {
        var checklist: Checklist!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = checklist.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklist.items.count
    }
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier( "ChecklistItem", forIndexPath: indexPath)
            let item = checklist.items[indexPath.row]
            configureTextForCell(cell, withChecklistItem: item) 
            configureCheckmarkForCell(cell, withChecklistItem: item)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
                if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                    //The checkmark is part of the cell (the accessory, remember?), so you first need to find the UITableViewCell object for the tapped row.
                    //this is not the same method as the data source method tableView(cellForRowAtIndexPath).
                    //Because it is theoretically possible that there is no cell at the specified index-path,for example if that row isn’t visible, you need to use the special if let statement.
                let item = checklist.items[indexPath.row]
        item.toggleChecked()
        configureCheckmarkForCell(cell, withChecklistItem: item)
            }
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        checklist.items.removeAtIndex(indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    //When the commitEditingStyle method is present in your view controller (it comes from the table view data source), the table view will automatically enable swipe-to- delete. This is the swipe-to-delete function.
    
    func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        //label.text = item.text
        label.text = "\(item.itemID): \(item.text)"
        //it's changed temperary to test variable item.itemID
    }
    
    func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        let label = cell.viewWithTag(1001) as! UILabel
                    if item.checked {
                    label.text = "√"
                    } else {
                    label.text = ""
                }
        label.textColor = view.tintColor
    }

    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem) {
        let newRowIndex = checklist.items.count
        checklist.items.append(item)
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func itemDetailViewController( controller:  ItemDetailViewController, didFinishEditingItem item: ChecklistItem) {
        if let index = checklist.items.indexOf(item) {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                configureTextForCell(cell, withChecklistItem: item) }
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddItem" {
        let navigationController = segue.destinationViewController as! UINavigationController
        let controller = navigationController.topViewController as! ItemDetailViewController
        //ThentopViewController property refers to the screen that is currently active inside the navigation controller.
        controller.delegate = self
        } else if segue.identifier == "EditItem" {
        let navigationController = segue.destinationViewController
            as! UINavigationController
        let controller = navigationController.topViewController
            as! ItemDetailViewController
        controller.delegate = self
        if let indexPath = tableView.indexPathForCell(
            sender as! UITableViewCell) {
            controller.itemToEdit = checklist.items[indexPath.row]
            }
        }
    }
}

