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
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func compose(sender: AnyObject) {
        dispatch_async(dispatch_get_main_queue()) {
            self.performSegueWithIdentifier("toComposeView", sender: self)
        }
    }
    
    
    func loadData(){
        //timelineData.removeAllObjects()
        
        // Tweetsテーブルを呼び出す
        var findTimelineData:PFQuery = PFQuery(className: "Talk")
        
        findTimelineData.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error:NSError?) -> Void in
            
            if (error == nil) {
                if let objs = objects {
                    for object in objs{
                        self.timelineData.addObject(object)
                    }
                }
                let array:NSArray = self.timelineData.reverseObjectEnumerator().allObjects
                //self.timelineData = array as! NSMutableArray
                println(array)
                
                //ここのtimelineDataにarrayが入ってない
                //self.timelineData = NSMutableArray(array: array)
                
                self.timelineData = NSMutableArray(array: array)
                
                println("timelineだよー")
                println(self.timelineData)
                self.tableView.reloadData()
            }
        }
    }


    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 229.0/255.0, green: 223.0/255.0, blue: 223.0/255.0, alpha: 1.0)
            loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.reloadData()
        timelineData = NSMutableArray()
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timelineData.count
    }
    

    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell :TimeLineTableViewCell = tableView.dequeueReusableCellWithIdentifier("timelineCell", forIndexPath: indexPath) as! TimeLineTableViewCell
        let talks :PFObject = self.timelineData.objectAtIndex(indexPath.row) as! PFObject
        println("talksだよー")
        println(talks)
        cell.title.text = talks.objectForKey("title") as? String
        cell.sideEffect.text = talks.objectForKey("SideEffect") as? String
        println(talks.objectForKey("title"))
        
        return cell
    }
    
   
}
