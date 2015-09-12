//
//  userModel_realm.swift
//  PatientStory
//
//  Created by 有村 琢磨 on 2015/09/12.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import RealmSwift

class User: Object {
    dynamic var name = ""
    dynamic var id = ""
    dynamic var age = ""
    dynamic var sex = ""
    dynamic var height = ""
    dynamic var weight = ""
}

