//
//  ClassTableViewController.swift
//  ClassAppDev
//
//  Created by Satsishur on 18.02.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//

import UIKit

class ClassTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var studentName = ""
    var studentSurname = ""
    var studentAge = ""
    var studentGender = ""
    
    var mockupData = DataManagement()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(mockupData.arrayOfStudents.count)
        return mockupData.arrayOfStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var studentCell: UITableViewCell
        let studentGenders = mockupData.arrayOfStudents[indexPath.row].gender
        switch studentGenders {
        case .female:
            studentCell = tableView.dequeueReusableCell(withIdentifier: FemaleXIBTableViewCell.id, for: indexPath)
        default:
            studentCell = tableView.dequeueReusableCell(withIdentifier: "student", for: indexPath)
        }
        let studentSurnames = mockupData.arrayOfStudents[indexPath.row].surname
        let studentNames = mockupData.arrayOfStudents[indexPath.row].name
        studentCell.textLabel?.text = "\(studentNames) \(studentSurnames)"
        return studentCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let student = mockupData.arrayOfStudents[indexPath.row]
        studentName = student.name
        studentSurname = student.surname
        studentAge = student.age
        let gend = student.gender
        switch gend {
        case .male:
            studentGender = "Male"
        case .female:
            studentGender = "Female"
        default:
            studentGender = "No info"
        }
        performSegue(withIdentifier: "profileFromTable", sender: nil)
        }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //print("deleted")
            mockupData.arrayOfStudents.remove(at: indexPath.row)
            //print(sample.arrayOfStudents)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //print(tableView.numberOfSections)
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(CodeTableViewCell.self, forCellReuseIdentifier: CodeTableViewCell.id)
        tableView.register(UINib(nibName: "FemaleXIBTableViewCell", bundle: nil), forCellReuseIdentifier: FemaleXIBTableViewCell.id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationVC = segue.destination as? ProfileViewController
        
            destinationVC?.studentName = studentName
            destinationVC?.studentSurname = studentSurname
            destinationVC?.studentAge = studentAge
            destinationVC?.studentGender = studentGender
    }
}

