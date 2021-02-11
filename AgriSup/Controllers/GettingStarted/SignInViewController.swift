//
//  SignInViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 11/02/2021.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let userType: String = UserDefaults.standard.value(forKey: K.UserDefaults.type) as? String ?? "None"
        
        if let email = emailTextfield.text,
           let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    print("There was an error automatically signing you in: \(error.localizedDescription)")
                } else {
                    
                    if userType == "customer" {
                        self.performSegue(withIdentifier: K.Segues.Login.toCustomerHomePage, sender: self)
                    } else  {
                        self.performSegue(withIdentifier: K.Segues.Login.toSupplierHomePage, sender: self)
                    }
                   
                }
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let email: String = UserDefaults.standard.value(forKey: K.UserDefaults.email) as? String ?? "None"
        let password: String = UserDefaults.standard.value(forKey: K.UserDefaults.password) as? String ?? "None"
        let userType: String = UserDefaults.standard.value(forKey: K.UserDefaults.type) as? String ?? "None"
        
        if email != "None" && password != "None" && userType != "None" {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    print("There was an error automatically signing you in: \(error.localizedDescription)")
                } else {
                    
                    if userType == "customer" {
                        self.performSegue(withIdentifier: K.Segues.Login.toCustomerHomePage, sender: self)
                    } else if userType == "supplier" {
                        self.performSegue(withIdentifier: K.Segues.Login.toSupplierHomePage, sender: self)
                    }
                   
                } 
            }
        }
    }
    

}
