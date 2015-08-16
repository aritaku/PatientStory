//
//  HomeViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/13.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var medicineNames :[String] = []
    
    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
        readData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicineNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell :HomeTableViewCell = tableView.dequeueReusableCellWithIdentifier("medicine_cell", forIndexPath: indexPath) as! HomeTableViewCell
        cell.medicine_nameLabel.text = "\(medicineNames[indexPath.row])"
        
        return cell
    }
    
    func readData(){
        let appDel :AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let myContext :NSManagedObjectContext = appDel.managedObjectContext!
        
        let myRequest : NSFetchRequest = NSFetchRequest(entityName: "Medicine")
        myRequest.returnsObjectsAsFaults = false
        
        var myResults: NSArray! = myContext.executeFetchRequest(myRequest, error: nil)
        medicineNames = []
        
        for myData in myResults {
            medicineNames.append(myData.name)
        }
        println(medicineNames)
        tableView.reloadData()
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
