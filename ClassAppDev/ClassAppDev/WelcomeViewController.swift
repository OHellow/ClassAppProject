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

//        if let userName = userName {
//                    welcomeLabel.text = "Welcome, \(userName)!\n "
//                }
//        else {
            welcomeLabel.text = "Welcome, \(userName ?? "Incognito")!"
//    }
    }
    
    @IBAction func profileButton(_ sender: Any) {
        let profileVC = ProfileViewController()

                //present(testVC, animated: true, completion: nil)
        navigationController?.pushViewController(profileVC, animated: true)
        
    }
    
    @IBAction func ClassButton(_ sender: Any) {
        //        let testVC = TestSampleViewController(testNumberLabel: 1)
        //
        //        //present(testVC, animated: true, completion: nil)
        //        navigationController?.pushViewController(testVC, animated: true)
    }
    

}

//class MainViewController: UIViewController {
//
//    @IBOutlet weak var welcomeLabel: UILabel!
//    @IBOutlet weak var profileButton: UIButton!
//    @IBOutlet weak var classButton: UIButton!
//
//    var userName: String!
//    var userPassword: String?
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if let userName = userName {
//            welcomeLabel.text = "Welcome, \(userName)!\n "
//        }
//        welcomeLabel.text = "Welcome, \(userName ?? "Incognito")!"
//    }
//
//    //при нажатии переход на profileVC
//    @IBAction func profileButtonPressed(_ sender: Any) {
//        performSegue(withIdentifier: "profileVC", sender: nil)
//    }
//    //при нажатии переход на classVC
//    @IBAction func classButtonPressed(_ sender: Any) {
//        performSegue(withIdentifier: "classVC", sender: nil)
//    }
//
//}
