//
//  NetworkManager.swift
//  ClassAppDev
//
//  Created by Satsishur on 24.03.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//
//swiftlint:disable identifier_name
import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    var cellData: [SWPerson] = []
    
    func fetchData(page: String?, completion: @escaping (Any?) -> Void) {
        
        let ai = UIActivityIndicatorView()
        ai.startAnimating()
        //ai.stopAnimating()
        let session = URLSession.shared
        guard let nextPage = page else {return}
        guard let url = URL(string: nextPage) else {return}
//        var components = URLComponents()
//        components.path = url!.path
//        components.scheme = url!.scheme
//        components.host = url!.host
//        components.queryItems = [
//            URLQueryItem(name: "page", value: String(page))
//        ]
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // дает возможность управлять кэшем, выставлять таймаут и работать с GET/POST
        //        uploadTask - закачать
        //        dowmloadTask
        let task = session.dataTask(with: request) { (data, response, error) in
            
                guard let  data = data else {return}
                guard error == nil else {return}
                guard let response = response as? HTTPURLResponse,
                    (200...299).contains(response.statusCode)
                    else {return}
                do {
                    let json = try JSONDecoder().decode(SWPeople.self, from: data)
                    json.people.forEach({print($0.name)})
                    completion(json)
                } catch {
                    print(error)
                }
            }
        task.resume() //каждый раз, когда создаем реквесты, надо делать resume
    }
}

struct SWPeople: Codable {
    let count: Int
    let next: String
    let people: [SWPerson]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case people = "results"
    }
}

struct SWPerson: Codable {
    let name: String
    let birth_year: String
    let mass: String
    let gender: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case birth_year
        case mass
        case gender
    }
}
