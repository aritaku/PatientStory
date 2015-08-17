//
//  HomeViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/13.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    var medicineNames :[String] = []
    
    @IBOutlet var tableView:UITableView!
    @IBOutlet var collectionView :UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 81/255.0, green: 178/255.0, blue: 172/255.0, alpha: 0.5)
        
        tableView.reloadData()
        readData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableView
    
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
    
    //MARK: - CollectionView
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let collectionCell :HomeCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("historyCell", forIndexPath: indexPath) as! HomeCollectionViewCell
        
        let now = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") // ロケールの設定
        dateFormatter.dateFormat = "MM/dd"// フォーマットの指定
        println(dateFormatter.stringFromDate(now))

        /*
        dateFormatter.timeStyle = .NoStyle // 時刻だけ表示させない
        dateFormatter.dateStyle = .ShortStyle
        println(dateFormatter.stringFromDate(now)) // -> 2014年6月24日火曜日
        */
        //let editNow :String = dateFormatter.stringFromDate(now).substringFromIndex(5)
        //let nowString :String = dateFormatter.stringFromDate(now)
        //let editNowString :String = nowString.substringFromIndex(5)
        //println(editNowString)
        collectionCell.dateLabel?.text = dateFormatter.stringFromDate(now)
        return collectionCell
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
