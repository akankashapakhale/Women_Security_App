//
//  MessageAndCallViewController.swift
//  Women_Security_App
//
//  Created by Akanksha pakhale on 27/09/21.
//

import UIKit

class MessageAndCallViewController: UIViewController {

    @IBOutlet weak var messageBtn: UIButton!
    
    @IBOutlet weak var callBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIForButton(button: messageBtn)
        setUIForButton(button: callBtn)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func openMessageTextField(_ sender: Any) {
        let alertController = UIAlertController(title: "Message", message: "Type Default Emergency Message", preferredStyle: .alert)

        alertController.addTextField { (textField) in
            // configure the properties of the text field
            textField.placeholder = "Message"
        }


        // add the buttons/actions to the view controller
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in

            // this code runs when the user hits the "save" button

            let inputName = alertController.textFields![0].text

            print(inputName!)

        }

        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)

        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func openCallContactList(_ sender: Any) {
    }
    
    @IBAction func takeToDashboard(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
      //  let controller = story.instantiateViewController(identifier: "DashBoardViewController") as! DashBoardViewController
         //self.present(controller, animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)//pushViewController()
    }
    
}
