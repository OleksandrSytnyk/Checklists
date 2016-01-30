
import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(controller: AddItemViewController)
    func addItemViewController(controller: AddItemViewController,
    didFinishAddingItem item: ChecklistItem)
    func addItemViewController(controller: AddItemViewController, didFinishEditingItem item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    var itemToEdit: ChecklistItem?
     //This variable contains the existing ChecklistItem object that the user will be editing. But when adding a new to-do item, itemToEdit will be nil. That is how the view controller will make the distinction between adding and editing.
        
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: AddItemViewControllerDelegate?
    
    @IBAction func cancel() {
    delegate?.addItemViewControllerDidCancel(self)
    }

    @IBAction func done() {
        if let item = itemToEdit {
            item.text = textField.text!
            delegate?.addItemViewController(self, didFinishEditingItem: item)
        } else {
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        delegate?.addItemViewController(self, didFinishAddingItem: item)
        }
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
        
        override func viewDidLoad() {
            if let item = itemToEdit {
        title = "Edit Item"
        //Each view controller has a number of built-in properties and title is one of them.
        textField.text = item.text
        doneBarButton.enabled = true
            }
        }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        doneBarButton.enabled = (newText.length > 0)
        return true//true means that the specified text should be changed.
    }//This is one of seven UITextField delegate methods. It is invoked every time the user changes the text, whether by tapping on the keyboard or by cut/paste.

}