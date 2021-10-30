//
//  ViewController.swift
//  Women_Security_App
//
//  Created by Akanksha pakhale on 17/09/21.
// Refrence for Validation in Text Field https://www.tutorialspoint.com/generic-way-to-validate-textfield-inputs-in-swift



import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    
    let defaults = UserDefaults.standard
    //let name = defaults.string(forKey: "nameIs")
    
    
    
    
    

    @IBOutlet weak var passwordAlertLbl: UILabel!
    @IBOutlet weak var emailAlertLbl: UILabel!
    @IBOutlet weak var phoneAlertLbl: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var logInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //MARK:SETTing UP UIs
        
        hideKeyboardWhenTappedAround()
        
        setUIForTextField(tf: validateEmailTxtFld)
        setUIForTextField(tf: validateNameTxtFld)
        setUIForTextField(tf: validatePhoneTxtFld)
        setUIForTextField(tf: validatePasswordTxtFld)
       // textFieldDidEndEditing(validateNameTxtFld)
        setAlertLabelUI(alertlable: alertLbl)
        setAlertLabelUI(alertlable: emailAlertLbl)
        setAlertLabelUI(alertlable: phoneAlertLbl)
        setAlertLabelUI(alertlable: passwordAlertLbl)
        setUIForHeaderView(headerview: headerView)
        setUIForButton(button: submitBtn)
        setUIForButton(button: logInBtn)
        
//        submitBtn.layer.cornerRadius = 8
//        submitBtn.backgroundColor = UIColor(red: 214.0/255.0, green: 129.0/255.0, blue: 174.0/255.0, alpha: 1)
//        submitBtn.setTitleColor(.white, for: .normal)
        //alertLbl.textColor = .red
//        validateEmailTxtFld.delegate = self
//        validateNameTxtFld.delegate = self
//        validatePhoneTxtFld.delegate = self
//        validatePasswordTxtFld.delegate = self
        }
    //MARK:Function for HeaderView UI
//    private func setUIForHeaderView(headerview: UIView){
//        headerview.layer.backgroundColor = UIColor(red: 214.0/255.0, green: 129.0/255.0, blue: 174.0/255.0, alpha: 1).cgColor
//        headerview.layer.cornerRadius = 30
//        headerview.layer.masksToBounds = true
//        headerview.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//    }
    //MARK:Function for AlertLable UI
//    private func setAlertLabelUI(alertlable: UILabel){
//        alertlable.textColor = .red
//        
//    }
  //  MARK:Function for TextField UI
    private func setUIForTextField(tf: UITextField){
        tf.layer.borderColor = UIColor(red: 214.0/255.0, green: 129.0/255.0, blue: 174.0/255.0, alpha: 1).cgColor
        tf.layer.borderWidth = 3
        tf.delegate = self
    }
    //MARK:Function for Dismiss Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
    //MARK:All StoryBoards Outlets
    @IBOutlet weak var validateNameTxtFld: UITextField!
    
    @IBOutlet weak var validateEmailTxtFld: UITextField!
    
    @IBOutlet weak var validatePhoneTxtFld: UITextField!
    
    @IBOutlet weak var validatePasswordTxtFld: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var alertLbl: UILabel!
    
    
    
    
    @IBAction func OpenUrlForTC(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "http://www.google.com")! as URL)
//        guard  let url = URL(string: "http://www.google.com") else {
//            return
//        }
//        let vc = SFSafariViewController(url: url)
//        present(vc, animated: true)
    }
    
    @IBAction func goToLoginView(_ sender: Any) {
        validatePhoneTxtFld.isHidden = true
        validateNameTxtFld.isHidden = true
        submitBtn.setTitle("Login", for: .normal)
        logInBtn.setTitle("Register", for: .normal)
        phoneAlertLbl.isHidden = true
        alertLbl.isHidden = true
        
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case validateNameTxtFld:
            checkTextField(textField: validateNameTxtFld, alrtLbl: alertLbl, incorrectMsg: "Enter Correct name", EmptyMsg: "Name field should not be Empty", selector: isValidname(_:))
            
        case validateEmailTxtFld:
            checkTextField(textField: validateEmailTxtFld, alrtLbl: emailAlertLbl, incorrectMsg: "Enter Correct Email", EmptyMsg: "Email field should not be Empty", selector: isValidEmail(_:))
            
        case validatePhoneTxtFld:
            checkTextField(textField: validatePhoneTxtFld, alrtLbl: phoneAlertLbl, incorrectMsg: "Enter Correct phone number", EmptyMsg: "phone number should not be Empty", selector: isValidphoneNumber(_:))
            
        case validatePasswordTxtFld:
            checkTextField(textField: validatePasswordTxtFld, alrtLbl: passwordAlertLbl, incorrectMsg: "Enter password with atleast 1 Aphabet 1 numeric and minium lenght of 8 Character", EmptyMsg: "phone number should not be Empty", selector: isValidpassword(_:))
        default:
            ()
         }
        
    }
    typealias MethodsHandler = (String) -> Bool
    func checkTextField(textField: UITextField, alrtLbl: UILabel, incorrectMsg: String, EmptyMsg: String , selector: (String) -> Bool){
        if textField.text != nil && !textField.text!.isEmpty {
            if selector(textField.text!) {
                alrtLbl.isHidden = true
            }
            else {
                alrtLbl.text = incorrectMsg
                alrtLbl.isHidden = false
            }
          }
        else{
            alrtLbl.text = EmptyMsg
            alrtLbl.isHidden = false
        }
}
//        switch textField {
//        case validateNameTxtFld:
//            chckTextField(textField: validateNameTxtFld, alertlbl: alertLbl, msge: "empty", msginvalid: "invalid", selcor: isValidname(_:))
//        default:
//            ()
//        }
   
     
//    typealias MethodHandler2 = (String)  -> Bool
//    private func chckTextField(textField:UITextField,alertlbl:UILabel,msge:String, msginvalid:String,selcor:MethodHandler2){
//        if textField.text != nil && !textField.text!.isEmpty {
//            if selcor(textField.text!){
//                alertlbl.isHidden = true
//
//            }else{
//                alertlbl.text = msginvalid
//                alertlbl.isHidden = false
//            }
//        }else{
//            alertlbl.text = msge
//            alertlbl.isHidden = false
//        }
//    }
    
    //MARK:Checking Valid text in fields
    @IBAction func validateBtn(_ sender: Any) {
        //Alerts For Incorrect And Empty name Fields
        if ((validateNameTxtFld.text?.isEmpty) == nil) {
            alertLbl.text = "Name field should not be Empty"
        }
        else if  isValidname(validateNameTxtFld.text!) {
            print("sahi name hai")
        } else {
            alertLbl.text = "Enter Correct name"
        }
        
        //Alerts For Incorrect And Empty email Fields
        if ((validateEmailTxtFld.text?.isEmpty) == nil) {
            emailAlertLbl.text = "email field should not be Empty"
        } else if  isValidEmail(validateEmailTxtFld.text!) {
            print("sahi email hai")
        }
        else{
            emailAlertLbl.text = "Enter Correct Email"
        
        }
        //Alerts For Incorrect And Empty password Fields
        if ((validatePasswordTxtFld.text?.isEmpty) == nil){
            passwordAlertLbl.text = "Password field should not be Empty"
        }else if  isValidpassword(validatePasswordTxtFld.text!) {
            print("sahi email hai")
        }
        else{
            passwordAlertLbl.text = "Enter password with atleast 1 Aphabet 1 numeric and minium lenght of 8 Character"
        }
        //Alerts For Incorrect And Empty phoneNo. Fields
        if ((validatePhoneTxtFld.text?.isEmpty) == nil) {
            phoneAlertLbl.text = "Phone number field should not be empty"
        }else if isValidphoneNumber(validatePhoneTxtFld.text!) {
            print("sahi phone hai")
        }
        else{
           phoneAlertLbl.text = "Enter Correct phone number"
        }
      }
}




//MARK: Function for dismiss keyboard Tapp outside
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

