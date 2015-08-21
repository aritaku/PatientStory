//
//  Compliance.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/21.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit
import CoreData

@objc(Compliance)
class Compliance: NSManagedObject {
   
    @NSManaged var date:NSDate
    @NSManaged var history: String
    @NSManaged var morning: String
    @NSManaged var evening: String
    
}
