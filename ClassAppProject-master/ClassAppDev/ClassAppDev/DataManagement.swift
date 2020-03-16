//
//  DataManagement.swift
//  ClassAppDev
//
//  Created by Satsishur on 20.02.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//
//swiftlint:disable identifier_name
import Foundation
import UIKit

class DataManagement: NSObject {
    
    var arrayOfStudents = [Student]()

    override init() {
        super.init()
        collectStundentsData()
    }

    func collectDataFromFile() -> String {
        var allStudentString: String = ""

        if let path = Bundle.main.path(forResource: "Names", ofType: "txt") {
            do {
                try allStudentString = String(contentsOfFile: path)
            } catch {
                print("error: \(error)")
            }
        } else {
            print("File not found")
        }
        return allStudentString
    }

    func collectStundentsData() {//-> [Student]  {
        var arrayFromFile = [Substring]()
        var arrayFullInfo = [[Substring]]()

        let allStudentString = collectDataFromFile()
        arrayFromFile = allStudentString.split(separator: " ")
        arrayFromFile.forEach { studentData in
            arrayFullInfo.append(studentData.split(separator: "."))
        }
        arrayFullInfo.forEach { (splittedData) in
            var studentGender: Student.Gender
            switch splittedData[3] {
            case "м": studentGender = .male
            case "ж": studentGender = .female
            default:
                studentGender.self = .noInfo
            }
            arrayOfStudents.append(Student(name: String(splittedData[0]), surname: String(splittedData[1]), age: String(splittedData[2]), gender: studentGender))
        }
        //return arrayOfStudents
    }
}

extension DataManagement: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           print(arrayOfStudents.count)
           return arrayOfStudents.count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           var studentCell: UITableViewCell
           let student = arrayOfStudents[indexPath.row]
        switch student.gender {
        case .female:
               studentCell = tableView.dequeueReusableCell(withIdentifier: FemaleXIBTableViewCell.id, for: indexPath)
        default:
               studentCell = tableView.dequeueReusableCell(withIdentifier: "student", for: indexPath)
           }
        studentCell.textLabel?.text = "\(student.name) \(student.surname)"
           return studentCell
       }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayOfStudents.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
}
