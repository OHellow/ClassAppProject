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
    var studentNames = [String]()
    var studentSurnames = [String]()
    var studentGenders = [String]()
    var fileData = ""
    var studentName = ""
    var studentSurname = ""
    var studentAge = ""
    var studentGender = ""
    var ar = [String]()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        studentNames = DataManagement.studentNamesForTableView(DataManagement(studentNumber: 0))()
        return studentNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var studentCell: UITableViewCell
        studentGenders = DataManagement.studentGenderForTableView(DataManagement(studentNumber: 0))()
        switch studentGenders[indexPath.row] {
        case "ж":
            studentCell = tableView.dequeueReusableCell(withIdentifier: FemaleXIBTableViewCell.id, for: indexPath)
        default:
            studentCell = tableView.dequeueReusableCell(withIdentifier: "student", for: indexPath)
        }
        studentSurnames = DataManagement.studentSurnamesForTableView(DataManagement(studentNumber: 0))()
        studentCell.textLabel?.text = "\(studentNames[indexPath.row]) \(studentSurnames[indexPath.row])"
        return studentCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        studentInfo = DataManagement.detailStudentData(DataManagement(studentNumber: indexPath.row))()
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

