//
//  AllListsViewController.swift
//  Checklists
//
//  Created by MyMacbook on 2/1/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController {
    
    var lists: [Checklist]
    
    required init?( coder aDecoder: NSCoder) {
         lists = [Checklist]()
        super.init(coder: aDecoder)
         var list = Checklist()
        list.name = "Birthdays"
        lists.append(list)
        
        list = Checklist()//this line create a new Checklist with named "Groceries". Without it next line would juest rename the old instance of Checklist named "Birthdays"
        //this line breaks our connection with first instance of Checklist named "Birthdays" 
        list.name = "Groceries"
        lists.append(list)
        
        list = Checklist()
        list.name = "Cool Apps"
        lists.append(list)
        
        list = Checklist()
        list.name = "To Do"
        lists.append(list)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = cellForTableView(tableView)
        let checklist = lists[indexPath.row]
        cell.textLabel!.text = checklist.name
        cell.accessoryType = .DetailDisclosureButton
        return cell
    }
    
    func cellForTableView( tableView: UITableView) -> UITableViewCell {
        let cellIdentifier = "Cell"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) {
        return cell
            } else {
        return UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            performSegueWithIdentifier("ShowChecklist", sender: nil)
        //Previously, a tap on a row would automatically perform the segue because you had hooked up the segue to the prototype cell. However, the table view for this screen isn’t using prototype cells and therefore you have to perform the segue manually.
    }
}
