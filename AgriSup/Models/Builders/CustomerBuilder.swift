//
//  CustomerBuilder.swift
//  AgriSup
//
//  Created by Sonney Patel on 10/02/2021.
//

import Foundation

class CustomerBuilder {
    
    //Use this instance only
    static let builder = CustomerBuilder()
    
    //private initializer for singleton
    private init() {}
    
    var email : String = ""
    var firstName : String = ""
    var lastName : String = ""
    var mobileNumber : String = ""
    var deliveryDates: [String] = []
    var photos: [String] = []
    var financialInfo: Customer.FinancialInfo = Customer.FinancialInfo(accountName: "", bsb: "", accountNumber: "")
    
    func setEmail(email: String) {
        self.email = email
    }
    
    func setIdentity(firstName: String, lastName: String, mobileNumber: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.mobileNumber = mobileNumber
        
    }
    
    func appendPhotoURL(url: String) {
        photos.append(url)
    }
    
    func setDeliveryDates(deliveryDates: [String]){
        self.deliveryDates = deliveryDates
    }
    
    func setFinancialInfo(accountName: String, bsb: String, accountNumber: String) {
        self.financialInfo = Customer.FinancialInfo(accountName: accountName, bsb: bsb, accountNumber: accountNumber)
    }
    
    func build() -> Customer {
        return Customer(firstName: firstName, lastName: lastName, mobileNumber: mobileNumber, email: email, photo: photos, deliveryDates: deliveryDates, financialInfo: financialInfo)
    }
    
}
