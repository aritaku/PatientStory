//
//  SignUpInViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/18.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit

class SignUpInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var emailAddless: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signUp(sender: AnyObject) {
       
        //Build the terms and conditions alert
        let alertController = UIAlertController(title: "利用規約の確認",
            message: "利用規約に同意しますか？",
            preferredStyle: UIAlertControllerStyle.Alert
        )
        
        alertController.addAction(UIAlertAction(title: "同意します",
            style: UIAlertActionStyle.Default,
            handler: { alertController in self.processSignUp()})
        )
        
        alertController.addAction(UIAlertAction(title: "同意しません",
            style: UIAlertActionStyle.Default,
            handler: nil)
        )
        
        // Display alert
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func processSignUp() {
        
        var userEmailAddress = emailAddless.text
        var userPassword = password.text
        
        //Ensure username is lowercase
        userEmailAddress = userEmailAddress.lowercaseString
        
        //Add email address validation
        
        //Start activity indocator
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        //Create the user
        var user = PFUser()
        user.username = userEmailAddress
        user.password = userPassword
        user.email = userEmailAddress
        
        user.signUpInBackgroundWithBlock {
            (suceeded, error) -> Void in
            if error == nil {
                dispatch_async(dispatch_get_main_queue()) {
                        self.performSegueWithIdentifier("signInToTabBar", sender: self)
                }
            } else {
                self.activityIndicator.stopAnimating()
                
                if let message: AnyObject = error!.userInfo!["error"]{
                    self.message.text = "\(message)"
                }
            }
        }
        
    }
    
    @IBAction func SignIn(sender: AnyObject) {
        
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        var userEmailAddress = emailAddless.text
        userEmailAddress = userEmailAddress.lowercaseString
        
        var userPassword = password.text
        
        PFUser.logInWithUsernameInBackground(userEmailAddress, password:userPassword) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    self.performSegueWithIdentifier("signInToTabBar", sender: self)
                }
            } else {
                self.activityIndicator.stopAnimating()
                
                if let message: AnyObject = error!.userInfo!["error"] {
                    self.message.text = "\(message)"
                }
            }
        }
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.hidden = true
        activityIndicator.hidesWhenStopped = true
        // Do any additional setup after loading the view.
        
        self.emailAddless.delegate = self
        self.password.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
