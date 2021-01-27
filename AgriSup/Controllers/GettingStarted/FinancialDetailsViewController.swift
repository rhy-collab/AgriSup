//
//  FinancialDetailsViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 20/01/2021.
//

import UIKit

class FinancialDetailsViewController: UIViewController{
    
    @IBOutlet weak var accountNumberTextField: UITextField!
    @IBOutlet weak var bsbTextField: UITextField!
    @IBOutlet weak var accountNameTextField: UITextField!
    
    var supplierBuilder = SupplierBuilder.builder
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        if let accountName = accountNameTextField.text,
           let bsb = bsbTextField.text,
           let accountNumber = accountNumberTextField.text {
            
            supplierBuilder.setFinancialInfo(accountName: accountName, bsb: bsb, accountNumber: accountNumber)
            
            self.performSegue(withIdentifier: K.Segues.toFinalView, sender: self)
        } else {
            errorPopUpDisplayed("A piece of info is missing")
        }
    }
    
    func errorPopUpDisplayed(_ text: String) {
        let popUpWindow = PopUpWindow(title: "Error in sign up", text: text, buttontext: "OK")
        self.present(popUpWindow, animated: true, completion: nil)
    }
    
}
