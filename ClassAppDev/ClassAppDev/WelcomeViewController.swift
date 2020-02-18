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
//        let profileVC = ProfileViewController()
//
//        present(profileVC, animated: true, completion: nil)
    //  navigationController?.pushViewController(profileVC, animated: true)
       // performSegue(withIdentifier: "profileVC", sender: nil)
        
    }
    
    @IBAction func ClassButton(_ sender: Any) {
        //        let testVC = TestSampleViewController(testNumberLabel: 1)
        //
        //        //present(testVC, animated: true, completion: nil)
        //        navigationController?.pushViewController(testVC, animated: true)
    }
    

}


