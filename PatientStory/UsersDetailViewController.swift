//
//  UsersDetailViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/16.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit

class UsersDetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var medicineTextField: UITextField!
    @IBOutlet weak var illnessTextField: UITextField!
    @IBOutlet weak var medicalHistory: UITextView!

    
    @IBAction func userName(sender: AnyObject) {
        
        var userProfile: PFObject = PFObject(className: "User")
        
        userProfile["username"] = userNameTextField.text
        userProfile.saveInBackground()
        // Return to table view
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func ageSetting(sender: AnyObject) {
        
        var userProfile: PFObject = PFObject(className: "User")
        userProfile["age"] = ageTextField.text
        userProfile.saveInBackground()

    }
    @IBAction func sexSetting(sender: AnyObject) {
        
        var userProfile: PFObject = PFObject(className: "User")
        userProfile["sex"] = ageTextField.text
        userProfile.saveInBackground()

    }
    @IBAction func medicineSetting(sender: AnyObject) {
        
        var userProfile: PFObject = PFObject(className: "User")
        userProfile["medicine"] = ageTextField.text
        userProfile.saveInBackground()

    }
    
    @IBAction func illnessSetting(sender: AnyObject) {
        
        var userProfile: PFObject = PFObject(className: "User")
        userProfile["illnessName"] = ageTextField.text
        userProfile.saveInBackground()

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        ageTextField.delegate = self
        sexTextField.delegate = self
        illnessTextField.delegate = self
        medicineTextField.delegate = self
        
    }

    override func viewDidAppear(animated: Bool) {
        //self.navigationController?.navigationBar.barTintColor = UIColor(red: 81/255.0, green: 178/255.0, blue: 172/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 249.0/255.0, green: 223.0/255.0, blue: 233.0/255.0, alpha: 1.0)
        
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
