//
//  Supplier.swift
//  AgriSup
//
//  Created by Sonney Patel on 16/01/2021.
//

import Foundation


struct Supplier: Codable {
    
    let id: String
    let firstName: String
    let lastName: String
    let mobileNumber: String
    let photo: [String]
    let deliveryDates: [String] //enum?
    let deliveryCities: [String]
    let credentials: Credentials
    let transportProvider: TransportProvider
    let depotProvider: DepotProvider
    let financialInfo: FinancialInfo
    let Products: [Products]
    
    struct Credentials: Codable {
        let abn: String
        let farmingLicense: String
        let drivingLicense: String
    }
    
    struct TransportProvider: Codable {
        let name: String
        let businessName: String
        let mobileNumber: String
    }
    
    struct DepotProvider: Codable {
        let businessName: String
        let mobileNumber: String
        let address: String
        let postcode: String
    }
    
    //Do we need to encrypt this information?
    struct FinancialInfo: Codable {
        let accountName: String
        let bsb: String
        let accountNumber: String
    }
    
    struct Products: Codable {
        let name: String
        let unit: String
        let minOrderQuantity: Int
        let leadTime: Int
        let leadTimeUnits: String //enum
        let samples: Bool
        let sampleUnits: Int?
        let unitPrice: Double
        let currency: String //enum
    }
    
    
}
