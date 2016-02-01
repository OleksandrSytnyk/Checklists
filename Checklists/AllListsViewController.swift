//
//  AllListsViewController.swift
//  Checklists
//
//  Created by MyMacbook on 2/1/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = cellForTableView(tableView)
        cell.textLabel!.text = "List\(indexPath.row)"
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
