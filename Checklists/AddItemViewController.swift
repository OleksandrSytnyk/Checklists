
import UIKit

class AddItemViewController: UITableViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func cancel() {
    dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func done() {
        print("Content of the text field: \(textField.text!)")
    dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    //When the user taps in a cell, the table view sends the delegate a willSelectRowAtIndexPath message that says: “Hi delegate, I am about to select this particular row.” By returning the special value nil, the delegate answers: “Sorry, but you're not allowed to!”
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
        //giving the control focus
    }

}