//
//  SideEffect.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/08/21.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit
import CoreData

@objc(SideEffect)
class SideEffect: NSManagedObject {
   
    @NSManaged var region :String
    @NSManaged var grade :Int
    @NSManaged var date:NSDate
    
}
