//
//  ContactSelectionViewController.swift
//  Women_Security_App
//
//  Created by Akanksha pakhale on 25/09/21.

import UIKit
import Foundation
import Contacts

class ContactSelectionViewController: UIViewController {
    struct FetchedContact {
        var firstName: String
        var lastName: String
        var telephone: String
        var isSelected: Bool
        
    }
    let CellIdentifier = "TableCellView"
    var checked: [Bool]!
    var arr:[IndexPath] = []
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nextBtn: UIButton!
    var  contacts = [FetchedContact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
         tableView.delegate = self
         tableView.dataSource = self
         fetchContacts()
        checked = [Bool](repeating: false, count: contacts.count)
             tableView.dataSource = self
             tableView.delegate = self
             tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier)
        setUIForButton(button:nextBtn)
    }
    
//    private func checkSelection(){
//
//
//    }
    
    @IBAction func openContactandMessage(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "MessageAndCallViewController") as! MessageAndCallViewController
         //self.present(controller, animated: true, completion: nil)
        self.navigationController?.pushViewController(controller, animated: true)//pushViewController()

        
        
    }
    
    private func fetchContacts() {
        // 1.
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("failed to request access", error)
                return
            }
            if granted {
                // 2.
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    // 3.
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                        self.contacts.append(FetchedContact(firstName: contact.givenName, lastName: contact.familyName, telephone: contact.phoneNumbers.first?.value.stringValue ?? "nothing", isSelected: false))
                    })
                } catch let error {
                    print("Failed to enumerate contact", error)
                }
            } else {
                print("access denied")
            }
        }
    }


}
extension ContactSelectionViewController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].firstName + " " + contacts[indexPath.row].lastName
            cell.detailTextLabel?.text = contacts[indexPath.row].telephone
        if checked[indexPath.row] {
            cell.accessoryType = .checkmark
            arr.append(indexPath)
            //print("\(arr)append\(indexPath.row)")
           } else {
               cell.accessoryType = .none
            arr = arr.filter({$0 != indexPath})
            //print("\(arr)removed\(indexPath.row)")
           }
           return cell
       }

    
  //  }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedRows = arr.count
        if selectedRows >= 3 && !checked[indexPath.row]{showAlert()}
            else{
                tableView.deselectRow(at: indexPath, animated: true)
                checked[indexPath.row] = !checked[indexPath.row]
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
    }
    
    
    func showAlert() {
        let dialogMessage = UIAlertController(title: "Warning", message: "You can Select only 3 contacts", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
   
 
}
