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
    var activityIndicator = UIActivityIndicatorView()
    var studentName = ""
    var studentSurname = ""
    var studentAge = ""
    var studentGender = ""
    var profileTypeNumber = Int()
    var nextPage: String?
    static var characterData: [SWPerson] = []
//    let cellData: [Student] = {   //массив для  names.txt
//        let students = DataManagement()
//        return students.arrayOfStudents
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            NetworkManager.shared.fetchData(page: "https://swapi.co/api/people/?page=1", completion: {(data) in
                (data as? SWPeople)?.people.forEach({ClassCollectionViewController.characterData.append(SWPerson(name: $0.name, birth_year: $0.birth_year, mass: $0.mass, gender: $0.gender))})
                self.nextPage = (data as? SWPeople)?.next
                DispatchQueue.main.async {
                self.collectionView.reloadData()
                }
            })
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
        collectionView.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension ClassCollectionViewController:  UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(ClassCollectionViewController.characterData.count)
        return ClassCollectionViewController.characterData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row % 10 == 0 { //ClassCollectionViewController.characterData.count - 1 {
            activityIndicator.startAnimating()
            NetworkManager.shared.fetchData(page: nextPage, completion: { [weak self] data in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                if self.nextPage != (data as? SWPeople)?.next {
                    (data as? SWPeople)?.people.forEach({ClassCollectionViewController.characterData.append(SWPerson(name: $0.name, birth_year: $0.birth_year, mass: $0.mass, gender: $0.gender))})
                    self.nextPage = (data as? SWPeople)?.next
                }
                if self.nextPage == nil {
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                        //self.activityIndicator.isHidden = true
                        self.collectionView.reloadData()
                    }
                }
            })
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StudentCollectionViewCell.cellID, for: indexPath) as? StudentCollectionViewCell else {fatalError("Error")}
        //можно сохранить ссылочки страниц swapi в массив и когда indexPath == 10, то подгружать новую. Использовать reloadData
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
