//
//  HomeViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/13.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, NSFetchedResultsControllerDelegate {
    
    var medicineNames :[String] = []
    var medicineHistories :[NSManagedObject] = []
    
    @IBOutlet var tableView:UITableView!
    @IBOutlet var collectionView :UICollectionView!
    
    var fetchedResultController :NSFetchedResultsController = NSFetchedResultsController()
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().barTintColor = UIColor(hue: 249/255, saturation: 223/255, brightness: 233/255, alpha: 1.0)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        fetchedResultController = self.getFetchedResultController()
        fetchedResultController.delegate = self
        fetchedResultController.performFetch(nil)

        //self.navigationController?.navigationBar
        //println(managedObjectContext)
    }
    
    override func viewWillAppear(animated: Bool) {
//        UINavigationBar.appearance().barTintColor = UIColor(hue: 249/255, saturation: 223/255, brightness: 233/255, alpha: 1.0)
        
        readData()
        readCollectionData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - NSFetchResultController
    func getFetchedResultController() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController(fetchRequest: self.complianceFetchRequest(), managedObjectContext: managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }
    
    func complianceFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Compliance")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
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
        
        if (cell.medicine_nameLabel.text == "ゼローダ"){
            cell.imageView?.image = UIImage(named: "xel100ptp_2_s")
        } else if (cell.medicine_nameLabel.text == "ティーエスワン") {
        
        }
        
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
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "MM/dd"
        
        let now = NSDate()
        collectionCell.dateLabel?.text = dateFormatter.stringFromDate(now)
        
        
        //まだCoreDataからの服薬データの読み出し部分ができてない
        //medicinHistories=[NSManagedObject]からNSManagedObjectを取り出す部分がうまくいってない @ readData()メソッド
        /*
        collectionCell.dateLabel?.text = dateFormatter.stringFromDate(medicineHistories["date"])
        collectionCell.numberLabel?.text = medicineHistories[indexPath.row]["evening"]
        */
        return collectionCell
    }
    
    //登録した薬名を読み出すメソッド
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
        tableView.reloadData()
    }
    
    //服薬データを読み出すメソッド
    //まだうまく機能していない
    func readCollectionData() {
        let appDel :AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let myContext :NSManagedObjectContext = appDel.managedObjectContext!
        
        let myRequest : NSFetchRequest = NSFetchRequest(entityName: "Compliance")
        myRequest.returnsObjectsAsFaults = false
        
        var myResults: NSArray! = myContext.executeFetchRequest(myRequest, error: nil)
        medicineHistories = []
        
        for myData in myResults {
            //medicineHistories.append(myData as! NSDictionary)
            medicineHistories.append(myData as! NSManagedObject)
        }
        println(medicineHistories)
        collectionView.reloadData()
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
