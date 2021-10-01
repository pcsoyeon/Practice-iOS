//
//  ViewController.swift
//  AccessContacts
//
//  Created by soyeon on 2021/09/30.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var listTableView: UITableView!
    
    // MARK: - Local Variables
    
    var contactStore = CNContactStore()
    var contacts = [Contact]()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactStore.requestAccess(for: .contacts) { success, error in
            if success {
                print("Authorization Successfull")
            }
        }
        
        setTableView()
        fetchConstacts()
    }
}

extension ViewController {
    func setTableView() {
        listTableView.delegate = self
        listTableView.dataSource = self
    }
    
    func fetchConstacts() {
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        
        try! contactStore.enumerateContacts(with: request) { contact, stoppingPointer in
            let name = contact.givenName
            let familyName = contact.familyName
            let number = contact.phoneNumbers.first?.value.stringValue
            
            let contactToAppend = Contact(givinName: name, familyName: familyName, number: number ?? "")
            
            self.contacts.append(contactToAppend)
        }
        listTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let contactToDisplay = contacts[indexPath.row]
        cell.textLabel?.text = contactToDisplay.givinName + " " + contactToDisplay.familyName
        cell.detailTextLabel?.text = contactToDisplay.number
        dump(cell)
        return cell
    }
}

