//
//  RegisterCustomerViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 10/02/2021.
//

import UIKit
import Firebase

class RegisterCustomerViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var customerBuilder = CustomerBuilder.builder
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
        //confirm password == confirmpassword
        
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           let confirmPassword = confirmPasswordTextField.text {
            
            if ( password != confirmPassword) {
                self.errorPopUpDisplayed("Password and confirmed Passwords do not match")
            } else {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        
                    if let e = error {
                        self.errorPopUpDisplayed(e.localizedDescription)
                    } else {
                        
                        UserDefaults.standard.setValue(email, forKey: K.UserDefaults.email)
                        UserDefaults.standard.setValue(password, forKey: K.UserDefaults.password)
                        
                        //Todo Use to determine if the user is customer or supplier in login process
                        UserDefaults.standard.setValue("customer", forKey: K.UserDefaults.type
                        )
                        
                        self.customerBuilder.setEmail(email: email)
                        self.performSegue(withIdentifier: K.Segues.GettingStartedCustomer.customerToIdentityInfo, sender: self)
                    }
                }
            }
        }
    }
    
    func errorPopUpDisplayed(_ text: String) {
        let popUpWindow = PopUpWindow(title: "Error in sign up", text: text, buttontext: "OK")
        self.present(popUpWindow, animated: true, completion: nil)
    }
    

}
