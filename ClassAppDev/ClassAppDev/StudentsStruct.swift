//
//  StudentsStruct.swift
//  ClassAppDev
//
//  Created by Satsishur on 20.02.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//

import Foundation

struct Student {
    
    var name: String
    var surname: String
    var age: String
    var gender: Gender
    
    enum Gender {
        case male
        case female
        case noInfo
    }
    
}
