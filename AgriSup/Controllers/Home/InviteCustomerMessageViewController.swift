//
//  InviteCustomerMessageViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 04/02/2021.
//

import UIKit
import MessageUI
import Firebase

class InviteCustomerMessageViewController: UIViewController {
    
    var supplier: Supplier?
    var parseHelper = ParsingHelper()
    var firebaseService = FirebaseService()
    
    @IBOutlet weak var customerPhoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseService.searchDocumentDelegate = self
        let email: String = UserDefaults.standard.value(forKey: K.UserDefaults.email) as? String ?? "None"
        firebaseService.searchSuppliers(supplierID: email)
    }
    
    @IBAction func sendInvitePressed(_ sender: UIButton) {
        

        let composeVC = MFMessageComposeViewController()
        
        composeVC.messageComposeDelegate = self
        
        if let phoneNumber = customerPhoneNumber.text {
            composeVC.recipients = [phoneNumber]
            
            
            composeVC.body = "This message body needs to be populated with the six digit inviteCode \(supplier?.inviteCode ?? 1000000)"
             //Does this work?
            
            if MFMessageComposeViewController.canSendText() {
                self.present(composeVC, animated: true, completion: nil)
            }
        }
    }
}

extension InviteCustomerMessageViewController: FirebaseServiceDocumentSearchDelegate {
    func handleResult(documentSnapshot: DocumentSnapshot) {
        self.supplier = parseHelper.parseDataToSupplier(data: documentSnapshot.data()!)
    }
}


extension InviteCustomerMessageViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}
