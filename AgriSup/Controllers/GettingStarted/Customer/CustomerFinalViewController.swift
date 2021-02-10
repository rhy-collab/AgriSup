//
//  CustomerFinalViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 10/02/2021.
//

import UIKit
import Firebase

class CustomerFinalViewController: UIViewController {

    let db = Firestore.firestore()
    var customerBuilder = CustomerBuilder.builder
    let firebaseService = FirebaseService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseService.delegate = self
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
        
        let customer = customerBuilder.build()
        firebaseService.addCustomer(customer: customer)
        self.performSegue(withIdentifier: K.Segues.GettingStartedCustomer.toCustomerHome , sender: self)
    }
    
    func errorPopUpDisplayed(_ text: String) {
        let popUpWindow = PopUpWindow(title: "Error in sign up", text: text, buttontext: "OK")
        self.present(popUpWindow, animated: true, completion: nil)
    }
}

//MARK: - Extension FirebaseServiceDelegate
extension CustomerFinalViewController: FirebaseServiceDelegate {
    func handleError(error: Error) {
        errorPopUpDisplayed(error.localizedDescription)
    }
}
