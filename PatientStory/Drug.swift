//
//  Drug.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/09/13.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import RealmSwift

class Drug: Object {
    dynamic var id = ""
    dynamic var drugName = ""
    dynamic var startDate = ""
    dynamic var endDate = ""
    dynamic var amount = ""
}
