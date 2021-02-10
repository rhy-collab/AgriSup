//
//  CustomerFinancialInfoViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 10/02/2021.
//

import UIKit

class CustomerFinancialInfoViewController: UIViewController {

    @IBOutlet weak var accountNumberTextField: UITextField!
    @IBOutlet weak var bsbTextField: UITextField!
    @IBOutlet weak var accountNameTextField: UITextField!
    
    var customerBuilder = CustomerBuilder.builder
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        if let accountName = accountNameTextField.text,
           let bsb = bsbTextField.text,
           let accountNumber = accountNumberTextField.text {
            
            customerBuilder.setFinancialInfo(accountName: accountName, bsb: bsb, accountNumber: accountNumber)
            
            self.performSegue(withIdentifier: K.Segues.GettingStartedCustomer.customerToFinalViewInfo, sender: self)
        } else {
            errorPopUpDisplayed("A piece of info is missing")
        }
    }
    
    func errorPopUpDisplayed(_ text: String) {
        let popUpWindow = PopUpWindow(title: "Error in sign up", text: text, buttontext: "OK")
        self.present(popUpWindow, animated: true, completion: nil)
    }
    
}
