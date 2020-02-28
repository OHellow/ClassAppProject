//
//  ClassTableViewController.swift
//  ClassAppDev
//
//  Created by Satsishur on 18.02.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//

import UIKit

class ClassTableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var studentName = ""
    var studentSurname = ""
    var studentAge = ""
    var studentGender = ""
    
    var mockupData = DataManagement()
    
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
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(CodeTableViewCell.self, forCellReuseIdentifier: CodeTableViewCell.id)
        tableView.register(UINib(nibName: "FemaleXIBTableViewCell", bundle: nil), forCellReuseIdentifier: FemaleXIBTableViewCell.id)
        tableView.dataSource = mockupData
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationVC = segue.destination as? ProfileViewController
        
            destinationVC?.studentName = studentName
            destinationVC?.studentSurname = studentSurname
            destinationVC?.studentAge = studentAge
            destinationVC?.studentGender = studentGender
    }
}

