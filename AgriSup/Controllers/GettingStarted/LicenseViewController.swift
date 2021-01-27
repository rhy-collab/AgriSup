//
//  LicenseViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 20/01/2021.
//

import UIKit

class LicenseViewController: UIViewController {
    
    
    @IBOutlet weak var abnTextField: UITextField!
    
    @IBOutlet weak var farmingLicenseField: UITextField!
    
    @IBOutlet weak var driversLicenseTextField: UITextField!
    
    var supplierBuilder = SupplierBuilder.builder
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        if let abn = abnTextField.text,
           let farmingLicense = farmingLicenseField.text,
           let driversLicense = driversLicenseTextField.text {
            
            supplierBuilder.setCredentials(abn: abn, farmingLicense: farmingLicense, driversLicense: driversLicense)
            
            performSegue(withIdentifier: K.Segues.toPhotoInfo, sender: self)
        } else {
            errorPopUpDisplayed("There was a problem, please try again")
        }
    }
    
    func errorPopUpDisplayed(_ text: String) {
        let popUpWindow = PopUpWindow(title: "Error in sign up", text: text, buttontext: "OK")
        self.present(popUpWindow, animated: true, completion: nil)
    }
}
