//
//  WelcomeViewController.swift
//  ClassAppDev
//
//  Created by Satsishur on 17.02.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//
// swiftlint:disable identifier_name
import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName = ProfileManager.shared.login
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName)!"
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func profileButton(_ sender: Any) {
        }
    
    @IBAction func ClassButton(_ sender: Any) {
        //        let testVC = TestSampleViewController(testNumberLabel: 1)
        //        //present(testVC, animated: true, completion: nil)
        //        navigationController?.pushViewController(testVC, animated: true)
//        guard let vc = storyboard?.instantiateViewController(identifier: "table") else {return}
//            print("!!!!!!!!!!!!!!!!!!")
//            //vc.studentName.text = arrayOfStudents[indexPath.row].firstName
//            navigationController?.pushViewController(vc, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profileVC = segue.destination as? ProfileViewController
        let profileTypeNumber = Int.random(in: 1...3)
        profileVC?.profileType = profileTypeNumber
        profileVC?.studentName = userName //"Oleg"
        profileVC?.studentSurname = "Satishur"//"Satishur"
        profileVC?.studentAge = "22"
        profileVC?.studentGender = "Male"
    }
}

