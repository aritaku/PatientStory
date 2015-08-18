//
//  TimeLineViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/13.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView:UITableView!
    var timelineData : NSMutableArray = []
    
    func loadData(){
        timelineData.removeAllObjects()
        
        // Tweetsテーブルを呼び出す
        var findTimelineData:PFQuery = PFQuery(className: "Talk")
        
        findTimelineData.findObjectsInBackgroundWithBlock{
            (objects, error)->Void in
            
            /*
            if (error != nil){
                for object in objects {
                    self.timelineData.addObject(object)
                }
                
                let array:NSArray = self.timelineData.reverseObjectEnumerator().allObjects
                self.timelineData = array as! NSMutableArray
                
                self.tableView.reloadData()
            }
            */
            
            //self.messagesArray = [String]()
            
            if let objs = objects {
                for messageObject in objs {
                    let messageText:String? = (messageObject as! PFObject)["Title"] as? String
                    if messageText != nil {
                        //self.messagesArray.append(messageText!)
                        self.timelineData.addObject(messageText!)
                    }
                }
            }
        }
    }
    
    
    @IBAction func compose(sender: AnyObject) {
        dispatch_async(dispatch_get_main_queue()) {
            self.performSegueWithIdentifier("toComposeView", sender: self)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.barTintColor = UIColor.greenColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 81/255.0, green: 178/255.0, blue: 172/255.0, alpha: 1.0)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell :TimeLineTableViewCell = tableView.dequeueReusableCellWithIdentifier("timelineCell", forIndexPath: indexPath) as! TimeLineTableViewCell
        
        
        return cell
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
