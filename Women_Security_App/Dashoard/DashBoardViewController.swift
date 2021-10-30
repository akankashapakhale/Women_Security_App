//
//  DashBoardViewController.swift
//  Women_Security_App
//
//  Created by Akanksha pakhale on 23/09/21.
////Refrence for Image Picker
//https://stackoverflow.com/questions/27880607/how-to-assign-an-action-for-uiimageview-object-in-swift


import UIKit


class DashBoardViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var emergencyBtn: UIButton!
    
    @IBOutlet weak var addContact: UIButton!
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  imageView.image = UIImage(systemName:"person.circle")
        nameLbl.text = "Shakira"
        phoneNumberLbl.text = "9898XXXXXX"
        //emergencyBtn.setTitle("EMERGENCY", for: .normal)
        addContact.setTitle("ADD CONTACT", for: .normal)
        setUIForButton(button: addContact)
        emergencyBtn.layer.shadowColor = UIColor.red.cgColor
        emergencyBtn.layer.shadowOpacity = 0.5
        emergencyBtn.layer.shadowOffset = CGSize(width: 4, height: 4)
        emergencyBtn.layer.shadowRadius = 5.0

        // Set masksToBounds to false, otherwise the shadow
        // will be clipped and will not appear outside of
        // the view’s frame
        emergencyBtn.layer.masksToBounds = false
        
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(DashBoardViewController.setProfilePic))
                imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
    }
    
    @IBAction func OpenContacts(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "ContactSelectionViewController") as! ContactSelectionViewController
         //self.present(controller, animated: true, completion: nil)
        self.navigationController?.pushViewController(controller, animated: true)//pushViewController()
 }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imageView.image = image
            }

        }
    @objc func setProfilePic(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = false

                present(imagePicker, animated: true, completion: nil)
            }
    }
}



