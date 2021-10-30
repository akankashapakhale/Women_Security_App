//
//  Regex for Validation.swift
//  Women_Security_App
//
//  Created by Akanksha pakhale on 20/09/21.
//
import Foundation
//MARK: Function for name validation
func isValidname(_ name: String) -> Bool {
    let nameRegEx = "^[a-zA-Z ]{3,30}$"//".*[^A-Za-z ].*"
    
    let nameTest = NSPredicate(format:"SELF MATCHES[c] %@", nameRegEx)
    
    return nameTest.evaluate(with: name)
}
//MARK: Function for password validation

// Minimum 8 characters at least 1 Alphabet and 1 Number:

 func isValidpassword(_ password: String) -> Bool {
    let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    
    let passwordTest = NSPredicate(format:"SELF MATCHES[c] %@", passwordRegEx)
    return passwordTest.evaluate(with: password)
}
//MARK: Function for email validation
func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    
    let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
    return emailTest.evaluate(with: email)
}
/*  Indian Phone number Validation
     supporting phone formate
    This will support the following formats:

    8880344456
    +918880344456
    +91 8880344456
    +91-8880344456
    08880344456
    918880344456
 */
    //MARK: Function for phone number validation
    
    func isValidphoneNumber(_ phoneNumber: String) -> Bool {
        let phoneNumberRegEx = "^[6-9][0-9]{9}$"
        
        let phoneNumberTest = NSPredicate(format:"SELF MATCHES[c] %@", phoneNumberRegEx)
        return phoneNumberTest.evaluate(with: phoneNumber)
    }



//class Utility {
//    //MARK: Function for phone number validation
//
//   static func isValidphoneNumber(_ phoneNumber: String) -> Bool {
//        let phoneNumberRegEx = "^[6-9][0-9]{9}$"
//
//        let phoneNumberTest = NSPredicate(format:"SELF MATCHES[c] %@", phoneNumberRegEx)
//        return phoneNumberTest.evaluate(with: phoneNumber)
//    }
//}

    


