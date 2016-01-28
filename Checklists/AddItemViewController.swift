
import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
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
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        if newText.length > 0 {
            doneBarButton.enabled = true
        } else {
            doneBarButton.enabled = false
        }
        return true
    }//This is one of seven UITextField delegate methods. It is invoked every time the user changes the text, whether by tapping on the keyboard or by cut/paste.

}