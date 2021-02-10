//
//  DeliveryDetailsViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 20/01/2021.
//

import UIKit

class DeliveryDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var driverName: UITextField!
    @IBOutlet weak var driverPhoneNumber: UITextField!
    @IBOutlet weak var driverBusinessName: UITextField!
    @IBOutlet weak var depotPhoneNumber: UITextField!
    @IBOutlet weak var depotBusinessName: UITextField!
    @IBOutlet weak var depotDeliveryAddress: UITextField!
    
    var supplierBuilder = SupplierBuilder.builder
    
    @IBAction func nextPressed(_ sender: UIButton) {
        if let cityName = cityName.text,
           let driverName = driverName.text,
           let depotPhone = depotPhoneNumber.text,
           let depotBusinessName = depotBusinessName.text,
           let driverPhoneNumber = driverPhoneNumber.text,
           let driverBusinessName = driverBusinessName.text,
           let depotDeliveryAddress = depotDeliveryAddress.text {
            
            supplierBuilder.appendDeliveryCity(cityName: cityName)
            supplierBuilder.appendDeliveryCityInfo(cityName: cityName, driverName: driverName, driverBusinessName: driverBusinessName, driverMobile: driverPhoneNumber, depotName: depotBusinessName, depotPhoneNumber: depotPhone, depotAddress: depotDeliveryAddress)
            
            performSegue(withIdentifier: K.Segues.GettingStartedSupplier.toSupplierFinancialInfo, sender: self)
        } else {
            errorPopUpDisplayed("At least one of the fields is missing")
        }
    }
    
    @IBAction func clickToAddAnotherCityPressed(_ sender: UIButton) {
        if let cityName = cityName.text,
           let driverName = driverName.text,
           let depotPhone = depotPhoneNumber.text,
           let depotBusinessName = depotBusinessName.text,
           let driverPhoneNumber = driverPhoneNumber.text,
           let driverBusinessName = driverBusinessName.text,
           let depotDeliveryAddress = depotDeliveryAddress.text {
            
            supplierBuilder.appendDeliveryCity(cityName: cityName)
            supplierBuilder.appendDeliveryCityInfo(cityName: cityName, driverName: driverName, driverBusinessName: driverBusinessName, driverMobile: driverPhoneNumber, depotName: depotBusinessName, depotPhoneNumber: depotPhone, depotAddress: depotDeliveryAddress)
            
        } else {
            errorPopUpDisplayed("At least one of the fields is missing")
        }
        
        cityName.text = ""
        driverName.text = ""
        depotPhoneNumber.text = ""
        depotBusinessName.text = ""
        driverPhoneNumber.text = ""
        driverBusinessName.text = ""
        depotDeliveryAddress.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func errorPopUpDisplayed(_ text: String) {
        let popUpWindow = PopUpWindow(title: "Error in sign up", text: text, buttontext: "OK")
        self.present(popUpWindow, animated: true, completion: nil)
    }
}
