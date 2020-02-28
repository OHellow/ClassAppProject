//
//  ProfileViewController.swift
//  ClassAppDev
//
//  Created by Satsishur on 17.02.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

  
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var studentName = "Name"
    var studentSurname = "Surname"
    var studentAge = "Age"
    var studentGender = "Gender"
    var info = "Во многих приложениях вы можете столкнуться с прокруткой, которая никогда не переносится в противоположном направлении в конце контента. Эта техника стандартна уже в течение многих лет, на многих платформах. С другой стороны, есть много сторонних библиотек, чтобы получить этот эффект. НО вам не нужно никакой сторонней библиотеки. У этой техники очень простая логика. Постраничная поддержка UIScrollView позволяет пользователю просматривать его содержимое постранично. UIScrollView включает этот эффект, регулируя смещение scrollView, когда пользователь заканчивает перетаскивание. Когда пользователь прокручивает до конца страниц (справа), scrollview ограничивает превышение его содержимого, перемещая его смещение в противоположном направлении с красивой анимацией."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = "Name: \(studentName)"
        surnameLabel.text = "Surname: \(studentSurname)"
        ageLabel.text = "Age: \(studentAge)"
        genderLabel.text = "Gender: \(studentGender)"
        infoLabel.text = info
        
        
        
    }
    

    

}
