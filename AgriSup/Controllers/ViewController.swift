//
//  ViewController.swift
//  AgriSup
//
//  Created by Rhys Coombes on 13/1/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var supplierMobileNumber: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var driversLicenseNumber: UITextField!
    @IBOutlet weak var farmingLicense: UITextField!
    @IBOutlet weak var abn: UITextField!
    var firstString: String = "before"
    var secondString: String = "before"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStartedButtonPressed(_ sender: UIButton) {
        
        
        
        
//        print(self.restorationIdentifier)
//        if self.restorationIdentifier == "SupplierInfo" {
//            firstString = "after"
//            self.performSegue(withIdentifier: "one", sender: self)
//        } else if self.restorationIdentifier == "SupplierInfoImportant" {
//            secondString = "after"
//            self.performSegue(withIdentifier: "two", sender: self)
//        }
//
//        print("firstString is \(firstString)")
//        print("secondString is \(secondString)")
    }
    
}

