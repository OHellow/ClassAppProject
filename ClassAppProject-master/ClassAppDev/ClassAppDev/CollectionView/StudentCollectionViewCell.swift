//
//  StudentCollectionViewCell.swift
//  ClassAppDev
//
//  Created by Satsishur on 20.03.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//

import UIKit

class StudentCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "cell"
    
    let imageView = UIImageView()
    let studentName: UILabel = {
        let name = UILabel()
        name.text = "name"
        return name
    }()
    let studentSurname: UILabel = {
        let surname = UILabel()
        surname.text = "surname"
        return surname
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StudentCollectionViewCell {
    func createCell() {
        addSubview(imageView)
        addSubview(studentName)
        addSubview(studentSurname)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        studentSurname.translatesAutoresizingMaskIntoConstraints = false
        studentName.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
//        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2 / 3).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        studentName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        studentName.bottomAnchor.constraint(equalTo: studentSurname.topAnchor, constant: 5).isActive = true
//        studentName.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor).isActive = true
        studentName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        studentName.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        studentSurname.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        studentSurname.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
//        studentSurname.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor).isActive = true
        studentSurname.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        studentSurname.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
