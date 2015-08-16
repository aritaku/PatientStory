//
//  Medicine.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/16.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit
import CoreData

@objc(Medicine)
class Medicine: NSManagedObject {
    
    @NSManaged var name :String?
    @NSManaged var start_date :NSDate
    @NSManaged var end_date :NSDate
    @NSManaged var time :NSDate
   
}
