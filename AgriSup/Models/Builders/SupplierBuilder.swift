//
//  SupplierBuilder.swift
//  AgriSup
//
//  Created by Sonney Patel on 17/01/2021.
//

import Foundation

class SupplierBuilder {
    
    //Use this instance only
    static let builder = SupplierBuilder()
    
    //private initializer for singleton
    private init() {}
    
    var email : String = ""
    var firstName : String = ""
    var lastName : String = ""
    var mobileNumber : String = ""
    var abn: String = ""
    var farmingLicense: String = ""
    var driversLicense: String = ""
    var deliveryDates: [String] = []
    var deliveryCities: [String] = []
    var deliveryCityInfo: [DeliveryCityInfo] = []
    var financialInfo: Supplier.FinancialInfo = Supplier.FinancialInfo(accountName: "", bsb: "", accountNumber: "")
    var photos: [String] = []
    var productIDs : [String]? = []
    var inviteCode: Int = 0
    
    
    func setEmail(email: String) {
        self.email = email
    }
    
    func setIdentity(firstName: String, lastName:String, mobileNumber: String){
        self.firstName = firstName
        self.lastName = lastName
        self.mobileNumber = mobileNumber
    }
    
    func setCredentials(abn: String, farmingLicense: String, driversLicense: String) {
        self.abn = abn
        self.farmingLicense = farmingLicense
        self.driversLicense = driversLicense
    }
    
    func setDeliveryDates(deliveryDates: [String]){
        self.deliveryDates = deliveryDates
    }
    
    func appendDeliveryCity(cityName: String) {
        deliveryCities.append(cityName)
    }
    
    func appendPhotoURL(url: String) {
        photos.append(url)
    }
    
    func appendDeliveryCityInfo(cityName: String, driverName: String, driverBusinessName: String, driverMobile: String, depotName: String, depotPhoneNumber: String, depotAddress: String){
        let transportProvider: TransportProvider = TransportProvider(name: driverName, businessName: driverBusinessName, mobileNumber: driverMobile)
        let depotProvider: DepotProvider = DepotProvider(businessName: depotName, mobileNumber: depotPhoneNumber, address: depotAddress)
        
        let deliveryCityInfo = DeliveryCityInfo(cityName: cityName, transportProvider: transportProvider, depotProvider: depotProvider)
        
        self.deliveryCityInfo.append(deliveryCityInfo)
    }
    
    func setFinancialInfo(accountName: String, bsb: String, accountNumber: String) {
        self.financialInfo = Supplier.FinancialInfo(accountName: accountName, bsb: bsb, accountNumber: accountNumber)
    }
    
    func setInviteCode(inviteCode: Int) {
        self.inviteCode = inviteCode
    }
    
    func build() -> Supplier {
        
        let credentials = Supplier.Credentials(abn: abn, farmingLicense: farmingLicense, drivingLicense: driversLicense)
        
        return Supplier(firstName: firstName, lastName: lastName, mobileNumber: mobileNumber,email: email, photo: photos, deliveryDates: deliveryDates, credentials: credentials, deliveryCities: deliveryCities, deliveryCityInfo: deliveryCityInfo, financialInfo: financialInfo, productIDs: productIDs!, inviteCode: inviteCode)
    }
    
}
