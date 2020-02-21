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
    
    var studentInfo = [String]()
    var studentNames = ""
    var studentSurnames = ""
    var studentGenders = [String]()
    var fileData = ""
    var studentName = ""
    var studentSurname = ""
    var studentAge = ""
    var studentGender = ""
    var ar = [String]()
    
    var sample = DataManagement()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sample.collectStundentsData()
        //let studs = sample.studentNamesForTableView()
        return sample.arrayOfStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var studentCell: UITableViewCell
        let studentGenders = sample.studentGenderForTableView()
        switch studentGenders[indexPath.row] {
        case "ж":
            studentCell = tableView.dequeueReusableCell(withIdentifier: FemaleXIBTableViewCell.id, for: indexPath)
        default:
            studentCell = tableView.dequeueReusableCell(withIdentifier: "student", for: indexPath)
        }
        studentSurnames = sample.arrayOfStudents[indexPath.row].surname
        studentNames = sample.arrayOfStudents[indexPath.row].name
        studentCell.textLabel?.text = "\(studentNames) \(studentSurnames)"
        return studentCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        studentInfo = sample.detailStudentData(studentNumber: indexPath.row)
        studentName = studentInfo[0]
        studentSurname = studentInfo[1]
        studentAge = studentInfo[2]
        studentGender = studentInfo[3]
        performSegue(withIdentifier: "profileFromTable", sender: nil)
        }
        
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            arrayOfStudents.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
    
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

