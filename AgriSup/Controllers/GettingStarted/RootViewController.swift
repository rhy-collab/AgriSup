//
//  ViewController.swift
//  AgriSup
//
//  Created by Rhys Coombes on 13/1/21.
//

import UIKit
import Firebase

class RootViewController: UIViewController {
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let email: String = UserDefaults.standard.value(forKey: K.UserDefaults.email) as? String ?? "None"
        let password: String = UserDefaults.standard.value(forKey: K.UserDefaults.password) as? String ?? "None"
        
        if email != "None" && password != "None" {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    print("There was an error automatically signing you in: \(error.localizedDescription)")
                } else {
                    self.performSegue(withIdentifier: K.Segues.autoLogin, sender: self)
                }
            }
        } else {
            print("create login flow")
        }
    }
    @IBAction func quickLoginPressed(_ sender: UIButton) {
        let email: String = UserDefaults.standard.value(forKey: K.UserDefaults.email) as? String ?? "None"
        let password: String = UserDefaults.standard.value(forKey: K.UserDefaults.password) as? String ?? "None"
        
        if email != "None" && password != "None" {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    print("There was an error automatically signing you in: \(error.localizedDescription)")
                } else {
                    self.performSegue(withIdentifier: K.Segues.straightToSearch, sender: self)
                }
            }
        } else {
            print("create login flow")
        }
    }
}

