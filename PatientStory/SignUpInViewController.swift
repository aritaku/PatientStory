//
//  SignUpInViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/18.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit

class SignUpInViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var emailAddless: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func SignUp(sender: AnyObject) {
    }
    
    @IBAction func SignIn(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.hidden = true
        activityIndicator.hidesWhenStopped = true
        // Do any additional setup after loading the view.
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
