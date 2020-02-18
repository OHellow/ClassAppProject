//
//  AuthorizationViewController.swift
//  ClassAppDev
//
//  Created by Satsishur on 17.02.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func LogInButton(_ sender: Any) {
        
        checkTextExist(textFieldText: loginTextField)
        checkTextExist(textFieldText: passwordTextField)
        checkPassword(textFieldPassword: passwordTextField)
        //performSegue(withIdentifier: "mainVC", sender: nil)
    }
    
    func checkTextExist(textFieldText: UITextField) {
        if textFieldText.text?.count == 0 {
                
                    let alertController = UIAlertController(title: "Alert", message: "Enter your Login.", preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                    alertController.addAction(cancelAction)
                    self.present(alertController, animated: true, completion: nil)
        }
    }
        func checkPassword(textFieldPassword: UITextField) {
            if textFieldPassword.text!.count < 3 {
                       
                        let alertController = UIAlertController(title: "Alert", message: "The password is too short", preferredStyle: .alert)
                        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                        alertController.addAction(cancelAction)
                        self.present(alertController, animated: true, completion: nil)
            }
        }
        
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                    let distinationViewController = segue.destination as? WelcomeViewController
            
                    distinationViewController?.userName = loginTextField.text
 
        }
}




