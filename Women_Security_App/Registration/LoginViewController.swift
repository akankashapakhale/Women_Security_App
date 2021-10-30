//
//  LoginViewController.swift
//  Women_Security_App
//
//  Created by Akanksha pakhale on 23/09/21.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var userAlertlbl: UILabel!
    
    @IBOutlet weak var passwordWongAlertLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setUIForHeaderView(headerview: headerView)
        //setUIForTextField(tf: userNameField)
        //setUIForTextField(tf: passwordField)
        setUIForButton(button: loginBtn)
        setUIForButton(button: registerBtn)
        setUIForTextField(tf: userNameField,delegate:self)
        setUIForTextField(tf: passwordField,delegate:self)
    }
//    private func setUIForTextField(tf: UITextField){
//        tf.layer.borderColor = UIColor(red: 214.0/255.0, green: 129.0/255.0, blue: 174.0/255.0, alpha: 1).cgColor
//        tf.layer.borderWidth = 3
//        tf.delegate = self
//    }
    
    @IBAction func validationCheck(_ sender: Any) {
        if ((userNameField.text?.isEmpty) == nil) {
            userAlertlbl.isHidden = false
            userAlertlbl.text = "email field should not be Empty"
        } else if  isValidEmail(userNameField.text!) || isValidphoneNumber(userNameField.text!) {
            userAlertlbl.isHidden = true
        }
        else{
            userAlertlbl.isHidden = false
            userAlertlbl.text = "Enter Correct Email"
            
        }
        if ((passwordField.text?.isEmpty) == nil){
            passwordWongAlertLbl.isHidden = false
            passwordWongAlertLbl.text = "Password field should not be Empty"
        }else if  isValidpassword(passwordField.text!) {
            passwordWongAlertLbl.isHidden = true
            print("sahi email hai")
        }
        else{
            passwordWongAlertLbl.isHidden = false
            passwordWongAlertLbl.text = "Enter correct password "
        }
        
        
    }
    
}
