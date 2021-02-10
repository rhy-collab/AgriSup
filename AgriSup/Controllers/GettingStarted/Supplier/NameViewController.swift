//
//  NameViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 20/01/2021.
//

import UIKit

class NameViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    var supplierBuilder: SupplierBuilder = SupplierBuilder.builder
    
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
        if let firstName = firstNameTextField.text,
           let lastName = lastNameTextField.text,
           let mobileNumber = mobileNumberTextField.text {
            
            supplierBuilder.setIdentity(firstName: firstName, lastName: lastName, mobileNumber: mobileNumber)
            
            self.performSegue(withIdentifier: K.Segues.GettingStartedSupplier.toSupplierPictureInfo, sender: self)
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
