//
//  Validator.swift
//  ClassAppDev
//
//  Created by Satsishur on 20.02.2020.
//  Copyright © 2020 swiftlesson2. All rights reserved.
//

import Foundation
// swiftlint:disable all
class Validator {
    
    func isPasswordValid(_ value: String) -> Bool {
        
        do {
               if try NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{3,}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                   return false
               }
           } catch {
               return false
           }
        return true
    }
    
    func isLoginValid(_ value: String) -> Bool {
           
           do {
                  if try NSRegularExpression(pattern: "^[0-9a-zA-Z\\_]{1,}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                      return false
                  }
              } catch {
                  return false
              }
           return true
       }
    
}
//    func checkTextExist(textFieldText: UITextField) {
//           if textFieldText.text?.count == 0 {
//
//                       let alertController = UIAlertController(title: "Alert", message: "Enter your Login.", preferredStyle: .alert)
//                       let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
//                       alertController.addAction(cancelAction)
//                       self.present(alertController, animated: true, completion: nil)
//           }
//       }


