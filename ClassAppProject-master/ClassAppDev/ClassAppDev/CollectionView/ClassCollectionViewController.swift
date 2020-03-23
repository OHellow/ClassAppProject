//
//  ClassCollectionViewController.swift
//  ClassAppDev
//
//  Created by Satsishur on 20.03.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//

import UIKit

class ClassCollectionViewController: UIViewController {

    var collectionView: UICollectionView!
    var studentName = ""
    var studentSurname = ""
    var studentAge = ""
    var studentGender = ""
    var profileTypeNumber = Int()
    let cellData: [Student] = {
        let students = DataManagement()
        return students.arrayOfStudents
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
    
    func createView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StudentCollectionViewCell.self,
                                forCellWithReuseIdentifier: StudentCollectionViewCell.cellID)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension ClassCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StudentCollectionViewCell.cellID, for: indexPath) as? StudentCollectionViewCell else {fatalError("Error")}
        cell.studentName.text = cellData[indexPath.row].name
        cell.studentSurname.text = cellData[indexPath.row].surname
        switch cellData[indexPath.row].gender {
        case .male:
            cell.imageView.image = UIImage(named: "student-3")
            cell.backgroundColor = .systemTeal
        default:
            cell.imageView.image = UIImage(named: "student-2")
            cell.backgroundColor = .systemPink
        }
        return cell
    }
}

extension ClassCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let profileVC = storyboard?.instantiateViewController(identifier: "profileVC") as? ProfileViewController
        let student = cellData[indexPath.row]
        profileVC?.profileType = profileTypeNumber
        profileVC?.studentName = student.name
        profileVC?.studentSurname = student.surname
        profileVC?.studentAge = student.age
        let gend = student.gender
        switch gend {
        case .male:
            profileVC?.studentGender = "Male"
            profileVC?.imageName = "student-3"
        case .female:
            profileVC?.studentGender = "Female"
            profileVC?.imageName = "student-2"
        default:
            studentGender = "No info"
        }
        self.navigationController?.pushViewController(profileVC!, animated: true)
    }
}
