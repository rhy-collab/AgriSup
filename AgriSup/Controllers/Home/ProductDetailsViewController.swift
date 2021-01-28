//
//  ProductDetailsViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 26/01/2021.
//

import UIKit
import Firebase

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var unitsTextField: UITextField!
    @IBOutlet weak var minOrderQuantityTextField: UITextField!
    @IBOutlet weak var leadTimeTextField: UITextField!
    @IBOutlet weak var leadTimeUnitsPicker: UISegmentedControl!
    @IBOutlet weak var samplesBooleanPicker: UISegmentedControl!
    @IBOutlet weak var sampleUnitsTextField: UITextField!
    let db = Firestore.firestore()
    let firebaseService = FirebaseService()
    
    var productBuilder: ProductBuilder = ProductBuilder.builder
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseService.delegate = self
    }
    
    @IBAction func createProductButtonPressed(_ sender: UIButton) {
        
        let supplierID: String = UserDefaults.standard.value(forKey: K.UserDefaults.email) as? String ?? "None"
        
        let offerSamples = samplesBooleanPicker.titleForSegment(at: samplesBooleanPicker.selectedSegmentIndex)
        
        let leadTimeUnits = leadTimeUnitsPicker.titleForSegment(at: leadTimeUnitsPicker.selectedSegmentIndex)
        
        if let units = unitsTextField.text,
           let minOrders = Int(minOrderQuantityTextField.text!),
           let leadTime = Int(leadTimeTextField.text!),
           let safeLeadTimeUnits = leadTimeUnits,
           let safeOffersSamples = (offerSamples == "Yes" ? true : false),
           let sampleUnits = sampleUnitsTextField.text {
            
            var sampleUnitsInt: Int
            
            if sampleUnits == "" {
                sampleUnitsInt = 0
            } else {
                sampleUnitsInt = Int(sampleUnits)!
            }
            
            productBuilder.setOrderRequirements(unit: units, minOrderQuantity: minOrders, leadTime: leadTime, leadTimeUnits: safeLeadTimeUnits, samples: safeOffersSamples, sampleUnits: sampleUnitsInt)
            
            productBuilder.setSupplierID(supplierID: supplierID)
            
            
            let product: Product = productBuilder.build()
            firebaseService.addProduct(product: product)
            
            self.performSegue(withIdentifier: K.Segues.toHomePage, sender: self)
        } else {
            errorPopUpDisplayed("Missing fields, couldn't add product")
        }
        
    }
    

    func errorPopUpDisplayed(_ text: String) {
        let popUpWindow = PopUpWindow(title: "Error in sign up", text: text, buttontext: "OK")
        self.present(popUpWindow, animated: true, completion: nil)
    }
    
}

//MARK: - FirebaseServiceDelegate

extension ProductDetailsViewController: FirebaseServiceDelegate {
    func handleError(error: Error) {
        errorPopUpDisplayed(error.localizedDescription)
    }
}
