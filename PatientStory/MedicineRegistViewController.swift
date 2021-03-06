
//
//  MedicineRegistViewController.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/15.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit
import CoreData
import Parse

class MedicineRegistViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var nameTextField :UITextField?
    @IBOutlet var startDateTextField :UITextField?
    @IBOutlet var endDateTextField :UITextField?
    @IBOutlet var timingTextField :UITextField?

    var toolBar :UIToolbar = UIToolbar()
    let medicineName : [String] = ["ゼローダ", "ティーエスワン"]
    var EditRegion: String = ""
    var datePickerView:UIDatePicker = UIDatePicker()

    @IBAction func MedicineNameEditing(sender: UITextField) {

    }
    
    @IBAction func StartDateEditing(sender: UITextField) {
        EditRegion = "Start"
        datePickerView.datePickerMode = UIDatePickerMode.Date
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        sender.inputView = datePickerView
    }
    @IBAction func StartDateEdited(sender: UITextField) {
        // send data to Parse
        return
    }
    
    @IBAction func EndDateEditing(sender: UITextField) {
        EditRegion = "End"
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    @IBAction func EndDateEdited(sender: UITextField) {
        // send data to Parse
        return
    }
    
    func datePickerValueChanged(sender: UIDatePicker) {
        var dateformatter = NSDateFormatter()
        dateformatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateformatter.timeStyle = .NoStyle
        dateformatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateformatter.dateFormat = "YYYY/MM/dd"
        if EditRegion == "Start" {
            startDateTextField!.text = dateformatter.stringFromDate(sender.date)
        } else if EditRegion == "End" {
            endDateTextField!.text = dateformatter.stringFromDate(sender.date)
        } else {
            return
        }
    }
    
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
    }
    //MARK: - PickerView
    //薬名を選択する際のPickerViewの挙動がおかしい
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
    //このメソッドを改善する必要があるかも
    func tappedToolBarBtn() {
        self.nameTextField!.resignFirstResponder()
    }
    
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
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
