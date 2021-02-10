//
//  CustomerNameViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 10/02/2021.
//

import UIKit

class CustomerNameViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    var customerBuilder: CustomerBuilder = CustomerBuilder.builder
    
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
        if let firstName = firstNameTextField.text,
           let lastName = lastNameTextField.text,
           let mobileNumber = mobileNumberTextField.text {
            
            customerBuilder.setIdentity(firstName: firstName, lastName: lastName, mobileNumber: mobileNumber)
            
            self.performSegue(withIdentifier: K.Segues.GettingStartedCustomer.customerToPhotoInfo, sender: self)
        } else {
            errorPopUpDisplayed("There was a missing field, please try again")
        }
    }
    
    func errorPopUpDisplayed(_ text: String) {
        let popUpWindow = PopUpWindow(title: "Error in sign up", text: text, buttontext: "OK")
        self.present(popUpWindow, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
