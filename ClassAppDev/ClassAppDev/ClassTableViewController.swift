//
//  ClassTableViewController.swift
//  ClassAppDev
//
//  Created by Satsishur on 18.02.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//

import UIKit

class ClassTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct Student {
        var firstName: String
        var secondName: String
        var age: Int
        var email: String
    }
    
    var arrayOfStudents = [
        Student(firstName: "1", secondName: "11", age: 25, email: "email"),
        Student(firstName: "2", secondName: "22", age: 25, email: "email"),
        Student(firstName: "3", secondName: "33", age: 25, email: "email"),
        Student(firstName: "4", secondName: "44", age: 25, email: "email"),
        Student(firstName: "5", secondName: "55", age: 20, email: "email"),
        Student(firstName: "6", secondName: "66", age: 20, email: "email"),
        Student(firstName: "7", secondName: "77", age: 20, email: "email"),
        Student(firstName: "8", secondName: "88", age: 20, email: "email"),
        Student(firstName: "9", secondName: "99", age: 30, email: "email"),
        Student(firstName: "9", secondName: "100", age: 30, email: "email"),
        Student(firstName: "10", secondName: "110", age: 30, email: "email"),
        Student(firstName: "11", secondName: "120", age: 30, email: "email"),
        Student(firstName: "12", secondName: "130", age: 30, email: "email"),
        Student(firstName: "13", secondName: "140", age: 30, email: "email"),
        Student(firstName: "14", secondName: "150", age: 30, email: "email"),
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let studentCell = tableView.dequeueReusableCell(withIdentifier: "student", for: indexPath)
        
        let studentFN = arrayOfStudents[indexPath.row]
        studentCell.textLabel?.text = studentFN.firstName
        
        return studentCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           performSegue(withIdentifier: "profileStudentVC", sender: nil)
       }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
