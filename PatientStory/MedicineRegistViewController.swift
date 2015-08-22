
//
//  MedicineRegistViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/15.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit
import CoreData

class MedicineRegistViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var nameTextField :UITextField?
    @IBOutlet var startDateTextField :UITextField?
    @IBOutlet var endDateTextField :UITextField?
    @IBOutlet var timingTextField :UITextField?
    
    
    var toolBar :UIToolbar = UIToolbar()
    let medicineName : [String] = ["ゼローダ", "ティーエスワン"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField?.delegate = self
        self.startDateTextField?.delegate = self
        self.endDateTextField?.delegate = self
        self.timingTextField?.delegate = self
        
        
        var pickerView = UIPickerView()
        pickerView.showsSelectionIndicator = true
        pickerView.delegate = self
        
        //toolBar.barStyle = .BlackTranslucent
        toolBar.tintColor = UIColor.blackColor()
        toolBar.backgroundColor = UIColor.whiteColor()
        
        let accessoryBar = UIToolbar()
        accessoryBar.sizeToFit()
        
        let toolBarBtn = UIBarButtonItem(title: "完了", style: .Done , target: self, action: "tappedToolBarBtn")
        let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        accessoryBar.setItems([spacer, toolBarBtn], animated: true)
        toolBar.items = [toolBarBtn]
        
        nameTextField!.inputAccessoryView = toolBar
        nameTextField?.inputView = pickerView
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 229.0/255.0, green: 223.0/255.0, blue: 223.0/255.0, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func registDataButton(sender: AnyObject) {
        writeData()
        self.navigationController?.popViewControllerAnimated(true)
    }

    
    func writeData(){
        let appdel :AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let myContext :NSManagedObjectContext = appdel.managedObjectContext!
        
        let myEntity :NSEntityDescription! = NSEntityDescription.entityForName("Medicine", inManagedObjectContext: myContext)
        
        var newData = Medicine(entity :myEntity, insertIntoManagedObjectContext :myContext)
        newData.name = nameTextField!.text
        newData.start_date = NSDate()
//        newData.end_date = endDateTextField?.text
//        newData.time = timingTextField?.text
    }

    
    //MARK: - PickerView
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.medicineName.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return medicineName[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nameTextField?.text = medicineName[row]
        pickerView.hidden = true

    }
    
    func tappedToolBarBtn() {
        self.nameTextField!.resignFirstResponder()
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
