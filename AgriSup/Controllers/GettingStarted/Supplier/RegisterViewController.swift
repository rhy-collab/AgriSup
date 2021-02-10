//
//  RegisterViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 18/01/2021.
//

import Foundation
import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var supplierBuilder = SupplierBuilder.builder
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
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
                        UserDefaults.standard.setValue("supplier", forKey: K.UserDefaults.type)
                        
                        self.supplierBuilder.setEmail(email: email)
                        self.performSegue(withIdentifier: K.Segues.GettingStartedSupplier.toSupplierIdentityInfo, sender: self)
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
