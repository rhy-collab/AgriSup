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
    var deliveryCityInfo: [DeliveryCityInfo] = []
    
    
    func setEmail(email: String) -> SupplierBuilder {
        self.email = email
        return self
    }
    
    func setIdentity(firstName: String, lastName:String, mobileNumber: String) -> SupplierBuilder{
        self.firstName = firstName
        self.lastName = lastName
        self.mobileNumber = mobileNumber
        return self
    }
    
    func setCredentials(abn: String, farmingLicense: String, driversLicense: String) -> SupplierBuilder {
        self.abn = abn
        self.farmingLicense = farmingLicense
        self.driversLicense = driversLicense
        return self
    }
    
    func setDeliveryDates(deliveryDates: [String]) -> SupplierBuilder {
        self.deliveryDates = deliveryDates
        return self
    }
    
    func appendDeliveryCityInfo(cityName: String, driverName: String, driverBusinessName: String, driverMobile: String, depotName: String, depotPhoneNumber: String, depotAddress: String) -> SupplierBuilder {
        let transportProvider: TransportProvider = TransportProvider(name: driverName, businessName: driverBusinessName, mobileNumber: driverMobile)
        let depotProvider: DepotProvider = DepotProvider(businessName: depotName, mobileNumber: depotPhoneNumber, address: depotAddress)
        
        let deliveryCityInfo = DeliveryCityInfo(cityName: cityName, transportProvider: transportProvider, depotProvider: depotProvider)
        
        self.deliveryCityInfo.append(deliveryCityInfo)
        
        return self
    }
    
    
    
}
