//
//  UsersDetailViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/16.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit
import CoreData

class UsersDetailViewController: UIViewController, UITextFieldDelegate {
    
    var cellPattern :Int = 0
    @IBOutlet var detailLabel :UILabel?
    @IBOutlet var detailTextField :UITextField?
    
    var userName :String?
    var age :Int = 0
    var sex :String = ""
    var medicineNames :[String] = []
    var nameOfIllness :String = ""
    var medicalHistories :[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel?.text = ""
        detailTextField?.text = ""
        
        self.detailTextField?.delegate = self
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        switch(cellPattern){
        case 1:
            detailLabel!.text = "ユーザー名"
            cellPattern = 0
        case 2:
            detailLabel?.text = "年齢・性別"
            cellPattern = 0
        case 3:
            detailLabel?.text = "服用中のお薬"
            cellPattern = 0
        case 4:
            detailLabel?.text = "疾患名"
            cellPattern = 0
        case 5:
            detailLabel?.text = "既往歴"
            cellPattern = 0
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func readData(){
        let appDel :AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let myContext :NSManagedObjectContext = appDel.managedObjectContext!
        let myRequest :NSFetchRequest = NSFetchRequest(entityName: "User")
        myRequest.returnsObjectsAsFaults = false
        
        var myResults: NSArray! = myContext.executeFetchRequest(myRequest, error: nil)
        
        
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
