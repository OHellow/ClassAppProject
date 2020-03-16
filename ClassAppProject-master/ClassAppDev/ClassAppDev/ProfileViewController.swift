//
//  ProfileViewController.swift
//  ClassAppDev
//
//  Created by Satsishur on 17.02.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//
// swiftlint:disable all
import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var profileType = Int()
    var studentName = "Name"
    var studentSurname = "Surname"
    var studentAge = "Age"
    var studentGender = "Gender"
    var info = "Во многих приложениях вы можете столкнуться с прокруткой, которая никогда не переносится в противоположном направлении в конце контента. Эта техника стандартна уже в течение многих лет, на многих платформах. С другой стороны, есть много сторонних библиотек, чтобы получить этот эффект. НО вам не нужно никакой сторонней библиотеки. У этой техники очень простая логика. Постраничная поддержка UIScrollView позволяет пользователю просматривать его содержимое постранично."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Name: \(studentName)"
        surnameLabel.text = "Surname: \(studentSurname)"
        ageLabel.text = "Age: \(studentAge)"
        genderLabel.text = "Gender: \(studentGender)"
        infoLabel.text = info
        image.frame.size = CGSize(width: 128, height: 128)
        image.layer.borderWidth = 3.0
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.layer.cornerRadius = 64
        image.clipsToBounds = true
        profileTypeFunc()
    }
   
    func profileTypeFunc() {
        switch profileType {
        case 1: //использует storyboard
                  break
        case 2:
                   view.addSubview(image)
                   image.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -90).isActive = true
                   image.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -230).isActive = true
                   view.addSubview(nameLabel)
                   nameLabel.anchor(top: nil, leading: image.trailingAnchor, bottom: view.centerYAnchor, trailing: nil, padding: .init(top: 0, left: 50, bottom: -280, right: 0))
                   view.addSubview(surnameLabel)
                   surnameLabel.anchor(top: nameLabel.bottomAnchor, leading: image.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 50, bottom: 0, right: 0))
                   view.addSubview(ageLabel)
                   ageLabel.anchor(top: surnameLabel.bottomAnchor, leading: image.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 50, bottom: 0, right: 0))
                   view.addSubview(genderLabel)
                   genderLabel.anchor(top: ageLabel.bottomAnchor, leading: image.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 50, bottom: 0, right: 0))
                   view.addSubview(infoLabel)
                   infoLabel.anchor(top: genderLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: -20))
                   
        case 3:
                   view.addSubview(nameLabel)
                   nameLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 30, left: 30, bottom: 0, right: 0))
                   view.addSubview(surnameLabel)
                   surnameLabel.anchor(top: nameLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 30, bottom: 0, right: 0))
                   view.addSubview(ageLabel)
                   ageLabel.anchor(top: surnameLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 30, bottom: 0, right: 0))
                   view.addSubview(genderLabel)
                   genderLabel.anchor(top: ageLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 30, bottom: 0, right: 0))
                   view.addSubview(image)
                   image.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 20).isActive = true
                   image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
                   view.addSubview(infoLabel)
                   infoLabel.anchor(top: genderLabel.bottomAnchor, leading: image.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 170, bottom: 0, right: -20))
                   
               default: break
               }
    }
}

extension UILabel {
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
    }
}




