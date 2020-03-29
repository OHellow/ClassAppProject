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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var userName = ProfileManager.shared.login
    var profileTypeNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName)!"
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func profileButton(_ sender: Any) {
        }
    
    @IBAction func ClassButton(_ sender: Any) {
    }
    
    @IBAction func segmentView(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            profileTypeNumber = 1
        case 1:
            profileTypeNumber = 2
        case 2:
            profileTypeNumber = 3
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profileVC = segue.destination as? ProfileViewController
        let classVC = segue.destination as? ClassCollectionViewController
        classVC?.profileTypeNumber = profileTypeNumber
        profileVC?.profileType = profileTypeNumber
        profileVC?.studentName = (profileVC?.studentName ?? "Name: ") + userName 
        profileVC?.studentSurname = (profileVC?.studentSurname ?? "Mass: ") + "90"
        profileVC?.studentAge = (profileVC?.studentAge ?? "Birth date: ") + "22"
        profileVC?.studentGender = (profileVC?.studentGender ?? "Gender: ") + "Male"
    }
}
