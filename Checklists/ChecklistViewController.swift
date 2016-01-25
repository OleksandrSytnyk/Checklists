//
//  ViewController.swift
//  Checklists
//
//  Created by MyMacbook on 1/24/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

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
                label.text = "Walk the dog"
            } else if indexPath.row == 1 {
                label.text = "Brush my teeth"
            } else if indexPath.row == 2 {
                label.text = "Learn iOS development"
            } else if indexPath.row == 3 {
                label.text = "Soccer practice"
            } else if indexPath.row == 4 {
                label.text = "Eat ice cream"
            }
        return cell
    }
    
}

