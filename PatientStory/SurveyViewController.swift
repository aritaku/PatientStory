//
//  SurveyViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/18.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit
import CoreData

class SurveyViewController: UIViewController {
    
    //日付と一緒に服薬記録を保存しHomeのCollectionViewに表示
    @IBOutlet var morningSegment :UISegmentedControl?
    @IBOutlet var eveningSegment :UISegmentedControl?
    
    @IBOutlet var morningLabel :UILabel?
    @IBOutlet var eveningLabel :UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 229.0/255.0, green: 223.0/255.0, blue: 223.0/255.0, alpha: 1.0)
        // Do any additional setup after loading the view.
        //morningSegment?.addTarget(self, action: "segmentChanged", forControlEvents: UIControlEvents.ValueChanged)
        //eveningSegment?.addTarget(self, action: "segmentChanged", forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let now = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "MM/dd"
        morningLabel?.text = "\(dateFormatter.stringFromDate(now))の朝"
        eveningLabel?.text = "\(dateFormatter.stringFromDate(now))の夕方"
    }
    
    @IBAction func registerButton(sender: AnyObject){
        writeData()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func writeData(){
        //CoreDataへの保存
        let appdel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let myContext :NSManagedObjectContext = appdel.managedObjectContext!
        let myEntity :NSEntityDescription! = NSEntityDescription.entityForName("Compliance", inManagedObjectContext: myContext)
        
        var newData = Compliance(entity :myEntity, insertIntoManagedObjectContext :myContext)
        newData.date = NSDate()
        
        if (morningSegment?.selectedSegmentIndex == 1){
            newData.morning = "◯"
        } else {
            newData.morning = "×"
        }
        
        if (eveningSegment?.selectedSegmentIndex == 1){
            newData.evening = "◯"
        } else {
            newData.evening = "×"
        }
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