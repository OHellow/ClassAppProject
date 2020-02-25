//
//  WelcomeViewController.swift
//  ClassAppDev
//
//  Created by Satsishur on 17.02.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "Welcome, \(userName ?? "Incognito")!"
        self.navigationItem.setHidesBackButton(true, animated: true)

    }
    
    @IBAction func profileButton(_ sender: Any) {
    }
    
    @IBAction func ClassButton(_ sender: Any) {
        //        let testVC = TestSampleViewController(testNumberLabel: 1)
        //
        //        //present(testVC, animated: true, completion: nil)
        //        navigationController?.pushViewController(testVC, animated: true)
//        guard let vc = storyboard?.instantiateViewController(identifier: "table") else {return}
//            print("!!!!!!!!!!!!!!!!!!")
//            //vc.studentName.text = arrayOfStudents[indexPath.row].firstName
//            navigationController?.pushViewController(vc, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profileVC = segue.destination as? ProfileViewController

        profileVC?.studentName = userName ?? "" //"Oleg"
        profileVC?.studentSurname = ""//"Satishur"
        profileVC?.studentAge = "22"
        profileVC?.studentGender = "Male"
    }
}


