//
//  DataManagement.swift
//  ClassAppDev
//
//  Created by Satsishur on 20.02.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//

import Foundation

class DataManagement {
    
    var arrayFromFile = [Substring]()
    var arrayFullInfo = [[Substring]]()
    var arrayOfStudents = [Student]()
    var allStudentString: String = ""
    var name = ""
    var surname = ""
    var age = ""
    var gender = ""
    var studentArray = [String]()
    var studentGender = Student.Gender.noInfo
    
    func collectDataFromFile() {
        if let path = Bundle.main.path(forResource: "Names", ofType: "txt"){
            do {
                try allStudentString = String(contentsOfFile: path)
            } catch {
                print("error: \(error)")
            }
        } else {
            print("File not found")
        }
    }
    
    func collectStundentsData() -> [Student]  {
   
            collectDataFromFile()
            arrayFromFile = allStudentString.split(separator: " ")
            arrayFromFile.forEach { studentData in
                arrayFullInfo.append(studentData.split(separator: "."))
            }
            arrayFullInfo.forEach { (splittedData) in
                switch splittedData[3] {
                case "м": studentGender = .male
                case "ж": studentGender = .female
                default:
                    studentGender.self = .noInfo
                }
                arrayOfStudents.append(Student(name: String(splittedData[0]), surname: String(splittedData[1]), age: String(splittedData[2]), gender: studentGender))
            }
            return arrayOfStudents
    }
}


    

