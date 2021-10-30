//
//  FormUI.swift
//  Women_Security_App
//
//  Created by Akanksha pakhale on 23/09/21.
//

import Foundation
import UIKit

func setUIForHeaderView(headerview: UIView) {
    headerview.layer.backgroundColor = UIColor(red: 214.0/255.0, green: 129.0/255.0, blue: 174.0/255.0, alpha: 1).cgColor
    headerview.layer.cornerRadius = 30
    headerview.layer.masksToBounds = true
    headerview.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
}
func setAlertLabelUI(alertlable: UILabel){
        alertlable.textColor = .red

    }
func setUIForButton(button: UIButton){
    button.layer.cornerRadius = 8
    button.backgroundColor = UIColor(red: 214.0/255.0, green: 129.0/255.0, blue: 174.0/255.0, alpha: 1)
    button.setTitleColor(.white, for: .normal)

    }
func setUIForTextField(tf: UITextField,delegate:UITextFieldDelegate){
        tf.layer.borderColor = UIColor(red: 214.0/255.0, green: 129.0/255.0, blue: 174.0/255.0, alpha: 1).cgColor
        tf.layer.borderWidth = 3
   tf.delegate = delegate
    }
