//
//  LoginViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 11/02/2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func sellerButtonPressed(_ sender: UIButton) {
        
        UserDefaults.standard.setValue("supplier", forKey: K.UserDefaults.type)
        
        self.performSegue(withIdentifier: K.Segues.Login.toLoginPage, sender: self)
    }
    
    @IBAction func buyerButtonPressed(_ sender: UIButton) {
        
        UserDefaults.standard.setValue("customer", forKey: K.UserDefaults.type)
        
        self.performSegue(withIdentifier: K.Segues.Login.toLoginPage, sender: self)
    }

}
