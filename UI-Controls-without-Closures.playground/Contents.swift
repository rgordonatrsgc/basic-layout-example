//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

// First, we will define a custom view controller named ViewController that
// is a sub-class of UIViewController
class ViewController : UIViewController {
    
    // This method determines the actual tip
    func determineTip() {
        print("touched the button")
    }
    
    // This method runs when the superview loads
    override func viewDidLoad() {
        
        // Sub-classes of UIViewController must invoke the superclass method viewDidLoad in their
        // own version of viewDidLoad()
        super.viewDidLoad()

        // Make the view's background be gray
        view.backgroundColor = UIColor.lightGrayColor()
        
        /*
         * Create label that will be the title
         */
        let title = UILabel()
        
        // Set the label text and appearance
        title.text = "Tip Calculator"
        title.font = UIFont.boldSystemFontOfSize(36)
        
        // Required to autolayout this label
        title.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the superview
        view.addSubview(title)

        /*
         * Create label for the amount field
         */
        let amount = UILabel()
        
        // Set the label text and appearance
        amount.text = "Amount"
        amount.font = UIFont.systemFontOfSize(24)
        
        // Required to autolayout this label.
        amount.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the amount label into the superview
        view.addSubview(amount)

        /*
         * Create text field for the amount
         */
        let amountGiven = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        
        // Set the label text and appearance
        amountGiven.borderStyle = UITextBorderStyle.RoundedRect
        amountGiven.font = UIFont.systemFontOfSize(15)
        amountGiven.placeholder = "Enter an amount"
        amountGiven.backgroundColor = UIColor.whiteColor()
        amountGiven.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        
        // Required to autolayout this field
        amountGiven.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the amount text field into the superview
        view.addSubview(amountGiven)
        
        /*
         * Add a button
         */
        let calculate = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        
        // Make the button, when touched, run the calculate method
        calculate.addTarget(self, action: #selector(ViewController.determineTip), forControlEvents: UIControlEvents.TouchUpInside)
        
        // Set the button's title
        calculate.setTitle("Calculate", forState: UIControlState.Normal)
        
        // Required to auto layout this button
        calculate.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the button into the super view
        view.addSubview(calculate)
        
        /*
         * Layout all the interface elements
         */

        // This is required to lay out the interface elements
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // Create an empty list of constraints
        var allConstraints = [NSLayoutConstraint]()
        
        // Create a dictionary of views that will be used in the layout constraints defined below
        let viewsDictionary : [String : AnyObject] = [
                     "label1": title,
                     "label2": amount,
                     "inputField1": amountGiven,
                     "button": calculate]
        
        // Define the vertical constraints
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[label1][label2][inputField1][button]",
            options: [],
            metrics: nil,
            views: viewsDictionary)

        // Add the vertical constraints to the list of constraints
        allConstraints += verticalConstraints

        // Define the horizontal constraints
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[label1]",
            options: [],
            metrics: nil,
            views: viewsDictionary)

        // Add the vertical constraints to the list of constraints
        allConstraints += horizontalConstraints
        
        // Activate all defined constraints
        NSLayoutConstraint.activateConstraints(allConstraints)
        
    }
}

// Embed the view controller in the live view for the current playground page
XCPlaygroundPage.currentPage.liveView = ViewController()
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
