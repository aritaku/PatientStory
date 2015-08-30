//
//  UserViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/21.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    //本来はParseよりユーザーデータを読み出して表示
    
    //@IBOutlet weak var tableView: UITableView!
    //let labelNames :[String] = ["ユーザー名", "性別", "年齢", "服用薬", "疾患名", "既往歴"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 249.0/255.0, green: 223.0/255.0, blue: 233.0/255.0, alpha: 1.0)
        
    }
    
   
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toEditView") {
        }
    }
    */

    
    /*
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.labelNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell :UserTableViewCell = tableView.dequeueReusableCellWithIdentifier("userCell", forIndexPath: indexPath) as! UserTableViewCell
        cell.settingLabel.text = labelNames[indexPath.row]
        
        return cell
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    

}
