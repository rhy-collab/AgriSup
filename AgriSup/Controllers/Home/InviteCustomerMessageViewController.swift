//
//  InviteCustomerMessageViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 04/02/2021.
//

import UIKit
import MessageUI

class InviteCustomerMessageViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    

    @IBOutlet weak var customerPhoneNumber: UITextField!
    
    @IBAction func sendInvitePressed(_ sender: UIButton) {
        
        let composeVC = MFMessageComposeViewController()
        
        composeVC.messageComposeDelegate = self
        
        if let phoneNumber = customerPhoneNumber.text {
            composeVC.recipients = [phoneNumber]
            composeVC.body = "This message body needs to be populated with the six digit number somewhere"
            if MFMessageComposeViewController.canSendText() {
                self.present(composeVC, animated: true, completion: nil)
            }
        }
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
