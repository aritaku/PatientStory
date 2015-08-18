//
//  ComposeViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/18.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var SideEffectTextField: UITextField!
    @IBOutlet weak var BodyTextView: UITextView!
    
    
    @IBAction func compose(sender: AnyObject) {
        
        var tweet: PFObject = PFObject(className: "Talk")
        
        tweet["title"] = titleTextField.text
        tweet["SideEffect"] = SideEffectTextField.text
        tweet["Body"] = BodyTextView.text
        
        tweet.saveInBackground()
        
        /*
        if let updateObject = currentObject as PFObject? {
            
            // Update the existing parse object
            updateObject["nameEnglish"] = nameEnglish.text
            updateObject["nameLocal"] = nameLocal.text
            updateObject["capital"] = capital.text
            updateObject["currencyCode"] = currencyCode.text
            
            // Save the data back to the server in a background task
            updateObject.saveEventually()
            
        } else {
            
            // Create a new parse object
            var updateObject = PFObject(className:"Countries")
            
            updateObject["nameEnglish"] = nameEnglish.text
            updateObject["nameLocal"] = nameLocal.text
            updateObject["capital"] = capital.text
            updateObject["currencyCode"] = currencyCode.text
            updateObject.ACL = PFACL(user: PFUser.currentUser())
            
            // Save the data back to the server in a background task
            updateObject.saveEventually()
            
        }
        */
        
        // Return to table view
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
