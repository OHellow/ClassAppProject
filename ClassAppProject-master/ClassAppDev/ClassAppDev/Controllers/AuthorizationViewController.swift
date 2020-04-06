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
    var gestureView: MoveableView = {
        let mv = MoveableView(frame: CGRect(x: 150, y: 500, width: 100, height: 100))
        mv.backgroundColor = .red
        return mv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initButton()
        self.animationButton.isHidden = true //скрыл анимацию кнопки
//        view.addSubview(TouchableView(frame: view.bounds))
//        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(swiped))
//        mv.addGestureRecognizer(swipeGesture)
//        mv.isUserInteractionEnabled = false //можно отключить userInteraction - вьюшка видна, но нельзя использовать тапы (например при наслоении вьюшек)
        view.addSubview(gestureView)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
        swipeLeft.direction = .left

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
        swipeRight.direction = .right

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
        swipeUp.direction = .up


        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
        swipeDown.direction = .down
        gestureView.addGestureRecognizer(swipeLeft)
        gestureView.addGestureRecognizer(swipeRight)
        gestureView.addGestureRecognizer(swipeUp)
        gestureView.addGestureRecognizer(swipeDown)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.handlePinch(_:)))
        gestureView.addGestureRecognizer(pinch)
        gestureView.isUserInteractionEnabled = true
    }
    
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        guard let gestureView = sender.view else { return }
        UIView.animate(withDuration: 0.3) {
            if sender.direction == .right {
                gestureView.backgroundColor = .yellow
            }
            else if sender.direction == .left {
                gestureView.backgroundColor = .green
            }
            else if sender.direction == .up {
                gestureView.backgroundColor = .systemTeal
            }
            else if sender.direction == .down {
                gestureView.backgroundColor = .orange
            }
        }
    }
    
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
        guard let pinchView = sender.view else { return }
        if sender.state == .began || sender.state == .changed {
            pinchView.transform = pinchView.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1
        }
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

class TouchableView: UIView {
    var firstTouchLocation = CGPoint(x: 0, y: 0)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("Touches began: \(touches.count)")
        firstTouchLocation =  touches.first?.location(in: self) ?? CGPoint(x: 0, y: 0)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print("Touches moved: \(touches.count)")
        guard let newpostion = touches.first?.location(in: self) else {return}
        let verticlaPosition = (firstTouchLocation.y - newpostion.y) / 100
        self.backgroundColor = UIColor(white: 0, alpha: verticlaPosition)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("Touches ended: \(touches.count)")
    }
}

class MoveableView: UIView {
    var firstTouchLocation = CGPoint(x: 0, y: 0)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("Touches began: \(touches.count)")
        firstTouchLocation =  touches.first?.location(in: self) ?? CGPoint(x: 0, y: 0)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print("Touches moved: \(touches.count)")
        guard let newpostion = touches.first?.location(in: self.superview) else {return}
        self.frame = CGRect(x: newpostion.x - firstTouchLocation.x, y: newpostion.y - firstTouchLocation.y, width: 100, height: 100)
    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesEnded(touches, with: event)
//        print("Touches ended: \(touches.count)")
//    }
}


          


