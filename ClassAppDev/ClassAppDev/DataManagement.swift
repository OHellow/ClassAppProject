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
//    var studentNumber: Int
    var studentArray = [String]()
    var studentNames = [String]()
    var studentSurnames = [String]()
    var studentGenders = [String]()
    var studentGender = Student.Gender.noInfo
    
//    init(studentNumber: Int) {
//        self.studentNumber = studentNumber
//    }
    
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
    
        func collectStundentsData() {
           
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
            
        }
        
    func detailStudentData(studentNumber: Int) -> [String] {
            collectStundentsData()
            studentArray = []
            name = arrayOfStudents[studentNumber].name
            surname = arrayOfStudents[studentNumber].surname
            age = arrayOfStudents[studentNumber].age
            studentGender = arrayOfStudents[studentNumber].gender
            switch studentGender {
            case .male:
                gender = "Male"
            case .female:
                gender = "Female"
            default:
                gender = "No info"
            }
            studentArray.append(name)
            studentArray.append(surname)
            studentArray.append(age)
            studentArray.append(gender)
            return studentArray
        }
        
        func studentGenderForTableView() -> [String] {
            //collectStundentsData()
            arrayFullInfo.forEach { (student) in
                studentGenders.append(String(student[3]))
            }
            return studentGenders
        }
    
   
        
    }

    

