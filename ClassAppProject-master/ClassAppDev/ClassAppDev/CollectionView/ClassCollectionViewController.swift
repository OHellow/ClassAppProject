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
    static var characterData: [SWPerson] = []
//    let cellData: [Student] = {   //массив для  names.txt
//        let students = DataManagement()
//        return students.arrayOfStudents
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
    
    override func loadView() {
        super.loadView()
        for page in 2...5 {
            NetworkManager.shared.fetchData(page: page, completion: {(data) in
                (data as? SWPeople)?.people.forEach({ClassCollectionViewController.characterData.append(SWPerson(name: $0.name, birth_year: $0.birth_year, mass: $0.mass, gender: $0.gender))})
                self.collectionView.reloadData()
            })
        }
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
        print(ClassCollectionViewController.characterData.count)
        return ClassCollectionViewController.characterData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StudentCollectionViewCell.cellID, for: indexPath) as? StudentCollectionViewCell else {fatalError("Error")}
        let students = ClassCollectionViewController.characterData[indexPath.row]
        cell.studentName.text = students.name
        cell.studentSurname.text = students.birth_year
        switch students.gender {
        case "male":
            cell.imageView.image = UIImage(named: "student-3")
            cell.backgroundColor = .systemTeal
        case "female":
            cell.imageView.image = UIImage(named: "student-2")
            cell.backgroundColor = .systemPink
        default:
            cell.imageView.image = UIImage(named: "robot")
            cell.backgroundColor = .systemYellow
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
        let student = ClassCollectionViewController.characterData[indexPath.row]
        profileVC?.profileType = profileTypeNumber
        profileVC?.studentName = (profileVC?.studentName ?? "Name: ") + student.name
        profileVC?.studentSurname = (profileVC?.studentSurname ?? "Mass: ") + student.mass
        profileVC?.studentAge = (profileVC?.studentAge ?? "Birth date: ") + student.birth_year
        let gend = student.gender
        switch gend {
        case "male":
            profileVC?.studentGender = (profileVC?.studentGender ?? "Gender: ") + gend
            profileVC?.imageName = "student-3"
        case "female":
            profileVC?.studentGender = (profileVC?.studentGender ?? "Gender: ") + gend
            profileVC?.imageName = "student-2"
        default:
            profileVC?.studentGender = (profileVC?.studentGender ?? "Gender: ") + gend
            profileVC?.imageName = "robot"
        }
        self.navigationController?.pushViewController(profileVC!, animated: true)
    }
}
