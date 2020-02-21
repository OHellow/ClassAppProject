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
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var validation = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func LogInButton(_ sender: Any) {
        
        performSegue(withIdentifier: "mainVC", sender: nil)
    }
    
    
    @IBAction func loginTFEditingChanged(login sender: UITextField) {
        //из класса Validator проверяем логин
        if validation.isLoginValid(sender.text ?? "") {
            loginLabel.textColor = .black
            button.isEnabled = true
        } else {
            loginLabel.textColor = .red
            button.isEnabled = false
        }
    }
    
    @IBAction func passwordTFEditingChanged(password sender: UITextField) {
        //из класса Validator проверяем пароль
        if validation.isPasswordValid(sender.text ?? "") {
            passwordLabel.textColor = .black
            button.isEnabled = true
        } else {
            passwordLabel.textColor = .red
            button.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as? UINavigationController
        let distinationViewController = navigationController?.viewControllers.first as? WelcomeViewController

        distinationViewController?.userName = loginTextField.text
//        let distinationViewController = segue.destination as? WelcomeViewController
//        distinationViewController?.userName = loginTextField.text
        }
}




