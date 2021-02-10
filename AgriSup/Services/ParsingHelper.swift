//
//  ParsingHelper.swift
//  AgriSup
//
//  Created by Sonney Patel on 04/02/2021.
//

import Foundation
import Firebase


class ParsingHelper {
    
//    Nasty Mapping method
    func parseDataToSupplier(data: [String: Any] ) -> Supplier{
        let supplierCredentialDTO : [String: Any] = data["credentials"] as! [String: Any]
        let abn: String = supplierCredentialDTO["abn"] as! String
        let farmingLicense = supplierCredentialDTO["farmingLicense"] as! String
        let drivingLicense = supplierCredentialDTO["drivingLicense"] as! String
        let credentials: Supplier.Credentials = Supplier.Credentials(abn: abn, farmingLicense: farmingLicense, drivingLicense: drivingLicense)
        
        let financialInfoDTO: [String: Any] = data["financialInfo"] as! [String: Any]
        let accountName = financialInfoDTO["accountName"] as! String
        let accountNumber = financialInfoDTO["accountNumber"] as! String
        let bsb = financialInfoDTO["bsb"] as! String
        let financialInfo = Supplier.FinancialInfo(accountName: accountName, bsb: bsb, accountNumber: accountNumber)
        
        let deliveryDates: [String] = data["deliveryDates"] as! [String]
        let deliveryCities: [String] = data["deliveryCities"] as! [String]
        
        let firstName = data["firstName"] as! String
        let lastName = data["lastName"] as! String
        let email = "TestEmail" //must get from document index
        let inviteCode = data["inviteCode"] as! Int
        let mobileNumber = data["mobileNumber"] as! String
        let documentReferenceProductIds = data["productIDs"] as! [DocumentReference]
        
        let photos  = data["photo"] as! [String]
        
        //nasty
        var productIDs: [String] = []
        
        documentReferenceProductIds.forEach { (documentReference) in
            productIDs.append(documentReference.path)
        }
        
        let deliveryCityInfoDTO = data["deliveryCityInfo"] as! [[String: Any]]
        
        var deliveryCityInfos: [DeliveryCityInfo] = []
        for val in deliveryCityInfoDTO {
            let cityName = val["cityName"] as! String
            
            let transportProviderDTO = val["transportProvider"] as! [String: Any]
            let transportName = transportProviderDTO["name"] as! String
            let transportBusinessName = transportProviderDTO["businessName"] as! String
            let mobileNumber = transportProviderDTO["mobileNumber"] as! String
            let transportProvider = TransportProvider(name: transportName, businessName: transportBusinessName, mobileNumber: mobileNumber)
            
            
            let depotProviderDTO = val["depotProvider"] as! [String: Any]
            let depotBusinessName = depotProviderDTO["businessName"] as! String
            let depotMobileNumber = depotProviderDTO["mobileNumber"] as! String
            let depotAddress = depotProviderDTO["address"] as! String
            let depotProvider = DepotProvider(businessName: depotBusinessName, mobileNumber: depotMobileNumber, address: depotAddress)
            
            let deliveryCityInfo = DeliveryCityInfo(cityName: cityName, transportProvider: transportProvider, depotProvider: depotProvider)
            
    
            deliveryCityInfos.append(deliveryCityInfo)
        }
        
        return Supplier(firstName: firstName, lastName: lastName, mobileNumber: mobileNumber, email: email, photo: photos, deliveryDates: deliveryDates, credentials: credentials, deliveryCities: deliveryCities, deliveryCityInfo: deliveryCityInfos, financialInfo: financialInfo, productIDs: productIDs, inviteCode: inviteCode)
        
    }
}
