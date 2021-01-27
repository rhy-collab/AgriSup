//
//  FinalSetupViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 20/01/2021.
//

import UIKit
import Firebase

class FinalSetupViewController: UIViewController {
    
    let db = Firestore.firestore()
    var supplierBuilder = SupplierBuilder.builder
    let firebaseService = FirebaseService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseService.delegate = self
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        let supplier = supplierBuilder.build()
        firebaseService.addSupplier(supplier: supplier)
        self.performSegue(withIdentifier: K.Segues.toMainPage , sender: self)
    }
    
    func errorPopUpDisplayed(_ text: String) {
        let popUpWindow = PopUpWindow(title: "Error in sign up", text: text, buttontext: "OK")
        self.present(popUpWindow, animated: true, completion: nil)
    }
}

//MARK: - Extension FirebaseServiceDelegate
extension FinalSetupViewController: FirebaseServiceDelegate {
    func handleError(error: Error) {
        errorPopUpDisplayed(error.localizedDescription)
    }
}
