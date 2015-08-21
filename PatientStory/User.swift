//
//  User.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/14.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit
import CoreData

@objc(User)
class User: NSManagedObject {
   
    @NSManaged var name:String?
    @NSManaged var sex :String?
    @NSManaged var medicine :String?
    @NSManaged var age :Int
    @NSManaged var medicalHitory :String
    @NSManaged var illnessName :String
    
    
}
