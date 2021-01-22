//
//  ViewController.swift
//  AgriSup
//
//  Created by Rhys Coombes on 13/1/21.
//

import UIKit
import Firebase

// test

class ViewController: UIViewController {
    @IBOutlet weak var supplierMobileNumber: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    
    let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func getStartedButtonPressed(_ sender: UIButton) {
        
    }
    
}

