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
    @IBOutlet weak var pricePerUnitTextField: UITextField!
    @IBOutlet weak var currencyTextField: UITextField!
    
    var productBuilder: ProductBuilder = ProductBuilder.builder
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
           let sampleUnits = sampleUnitsTextField.text ,
           let pricePerUnit = Double(pricePerUnitTextField.text ?? "0.0"),
           let currency = currencyTextField.text {
            
            var sampleUnitsInt: Int
            
            if sampleUnits == "" {
                sampleUnitsInt = 0
            } else {
                sampleUnitsInt = Int(sampleUnits)!
            }
            
        
            productBuilder.setOrderRequirements(unit: units, minOrderQuantity: minOrders, leadTime: leadTime, leadTimeUnits: safeLeadTimeUnits, samples: safeOffersSamples, sampleUnits: sampleUnitsInt, unitPrice: pricePerUnit, currency: currency)
            
            productBuilder.setSupplierID(supplierID: supplierID)
            
            let product: Product = productBuilder.build()
            
            
            // add it to firebase
            
            let productRef = db.collection(K.productCollection)
                .addDocument(data: product.createDic()!) { (error) in
                if let e = error {
                    print("There was an issue saving data to FireStore, \(e)")
                } else {
                    print("Successfully saved data")
                }
            }
            
            
            let supplierRef = db.collection(K.supplierCollection).document(product.supplierId)
//
            supplierRef.updateData([
                "productIDs": FieldValue.arrayUnion([productRef])
            ]) { err in
                if let err = err {
                    print("Error saving productId to firebase supplier collection \(err)")
                } else {
                    print("Success saving productid to firebase supplier collection")
                }
            }
        } else {
            errorPopUpDisplayed("Missing fields, couldn't add product")
        }
        
    }
    
    func errorPopUpDisplayed(_ text: String) {
        let popUpWindow = PopUpWindow(title: "Error in sign up", text: text, buttontext: "OK")
        self.present(popUpWindow, animated: true, completion: nil)
    }
    
}
