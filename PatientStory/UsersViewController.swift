//
//  UsersViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/13.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    var cellPattern :Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var detailVC :UsersDetailViewController = segue.destinationViewController as! UsersDetailViewController
//        if (segue.identifier == "userName_setting"){
//            cellPattern = 1
//        } if else (segue.identifier == "medicineName_setting"){
//            self.cellPattern = 2
//        }; if else (segue.identifier == "ageAndSex_setting"){
//            self.cellPattern = 3
//        }; if else (segue.identifier == "medicalHistories_setting"){
//            self.cellPattern = 4
//        }; else {
//            self.cellPattern = 0
//        }
    
        detailVC.cellPattern = cellPattern
    }
    

}
