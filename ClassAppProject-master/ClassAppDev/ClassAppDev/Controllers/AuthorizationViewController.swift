//
//  AuthorizationViewController.swift
//  ClassAppDev
//
//  Created by Satsishur on 17.02.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//
// swiftlint:disable all
import UIKit

class AuthorizationViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var validation = Validator()
    var counterOfPushes = 0
    let animationButton = UIButton()
    var xPosition = NSLayoutConstraint()
    var yPosition = NSLayoutConstraint()
    var widthOfButton = NSLayoutConstraint()
    var heightOfButton = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initButton()
        self.animationButton.isHidden = true //скрыл анимацию кнопки
    }
    
    @IBAction func LogInButton(_ sender: Any) {
        ProfileManager.shared.login = loginTextField.text ?? ""
        ProfileManager.shared.password = passwordTextField.text ?? ""
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
    
    func initButton() {
        view.addSubview(animationButton)
        animationButton.translatesAutoresizingMaskIntoConstraints = false
        xPosition = animationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        xPosition.isActive = true
        yPosition = animationButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 100)
        yPosition.isActive = true
        heightOfButton = animationButton.heightAnchor.constraint(equalToConstant: 160)
        heightOfButton.isActive = true
        widthOfButton = animationButton.widthAnchor.constraint(equalToConstant: 240)
        widthOfButton.isActive = true
        animationButton.backgroundColor = .red
        animationButton.setTitle("Kick me!", for: .normal)
        animationButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        switch counterOfPushes % 4 {
        case 0:
            widthOfButton.constant = 160
            UIView.animate(withDuration: 1,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 2.5,
                           options: .curveEaseIn,
                           animations: { [weak self] in
                            guard let self = self else {return}
                            self.counterOfPushes += 1
                            self.view.layoutIfNeeded()
                }, completion: nil)
        case 1:
            UIView.animate(withDuration: 1, delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 2.0,
                       options: .curveEaseOut,
                       animations: { [weak self] in
                        guard let self = self else {return}
                        self.counterOfPushes += 1
                }, completion: { [weak self] bool in
                    UIView.animate(withDuration: 1) { [weak self] in
                guard let self = self else {return}
                self.animationButton.layer.borderWidth = 3
                self.animationButton.backgroundColor = .yellow
                self.animationButton.setTitleColor(.black, for: .normal)
                    }
            })
        case 2:
            xPosition.constant = 400
            UIView.animate(withDuration: 1,
                           delay: 0,
                           options: .autoreverse,
                           animations: { [weak self] in
                            guard let self = self else {return}
                            self.counterOfPushes += 1
                            self.view.layoutIfNeeded()
            }, completion: {
                       [weak self] bool in
                UIView.animate(withDuration: 1) { [weak self] in
                       guard let self = self else {return}
                        self.xPosition.constant = 0
                   }
        })
        case 3:
            restore()
            UIView.animate(withDuration: 1,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 2.5,
                           options: .curveEaseIn,
                           animations: {[weak self] in
                        guard let self = self else {return}
                        self.counterOfPushes += 1
                        self.view.layoutIfNeeded()
            }, completion: nil)
        default:
            break
        }
    }
    
    func restore() {
        animationButton.backgroundColor = .red
        widthOfButton.constant = 240
        animationButton.layer.borderWidth = 0
    }
}
