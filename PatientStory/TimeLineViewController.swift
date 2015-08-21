//
//  TimeLineViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/13.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit
import Parse

class TimeLineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView:UITableView!
    var timelineData : NSMutableArray = NSMutableArray()
    
    @IBAction func compose(sender: AnyObject) {
        dispatch_async(dispatch_get_main_queue()) {
            self.performSegueWithIdentifier("toComposeView", sender: self)
        }
    }
    
    /*
    func loadData(callback:([PFObject]!, NSError!) -> ())  {
        var query: PFQuery = PFQuery(className: "Talk")
        query.orderByAscending("createdAt")
        
        //findObjectsInbackgroundWithBlock以下の書き方はswift1.1とswift1.2でことなる
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if (error == nil){
                for object:PFObject! in objects
                {
                    self.dataParse.addObject(object)
                }
            }
            //// add data into array
            let array:NSArray = self.dataParse.reverseObjectEnumerator().allObjects
            self.dataParse = array as NSMutableArray
            
            self.tableView.reloadData()
        }
    }
*/
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 229.0/255.0, green: 223.0/255.0, blue: 223.0/255.0, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        self.loadData { (, <#NSError!#>) -> () in
            <#code#>
        }
        
        self.loadData { (timeline, error) -> () in
            self.timelineData = timeline
            self.tableView.reloadData()
        }
        */
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell :TimeLineTableViewCell = tableView.dequeueReusableCellWithIdentifier("timelineCell", forIndexPath: indexPath) as! TimeLineTableViewCell
        
        return cell
    }
    
   
}
