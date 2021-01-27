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

        db.collection(K.supplierCollection)
            .document(supplier.email)
            .setData(supplier.createDic()!) { err in
                if let err = err {
                    print("There was an error writing your document...ooops...\(err)")
                } else {
                    print("Document printed successfully")
                }
            }
        
        self.performSegue(withIdentifier: K.Segues.toMainPage , sender: self)
    }
}
