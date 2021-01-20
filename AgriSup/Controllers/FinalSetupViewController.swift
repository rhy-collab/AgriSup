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
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
        let supplier = supplierBuilder.build()
        
        db.collection("suppliers").addDocument(data: supplier.createDic()!) { (error) in
            if let e = error {
                print("There was an issue saving data to FireStore, \(e)")
            } else {
                print("Successfully saved data")
                
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: K.Segues.toMainPage, sender: self)
                }
            }
        }
    }
}
