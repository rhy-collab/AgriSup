//
//  Supplier.swift
//  AgriSup
//
//  Created by Sonney Patel on 16/01/2021.
//

import Foundation


struct Supplier: Codable {
    
    let firstName: String
    let lastName: String
    let mobileNumber: String
    let email: String
    let photo: [String]
    let deliveryDates: [String]//enum?
    let credentials: Credentials
    let deliveryCities: [String]
    let deliveryCityInfo: [DeliveryCityInfo]
    let financialInfo: FinancialInfo
    var productIDs: [String]
    
    func createDic() -> [String: Any]? {
        guard let dic = self.dictionary else {
            return nil
        }
        
        return dic
    }
    
    func appendProductID(productId: String) {
        self.productIDs
    }
    
    struct Credentials: Codable {
        let abn: String?
        let farmingLicense: String?
        let drivingLicense: String?
        
        func createDic() -> [String: Any]? {
            guard let dic = self.dictionary else {
                return nil
            }
            
            return dic
        }
    }
    
    //Do we need to encrypt this information?
    struct FinancialInfo: Codable {
        let accountName: String?
        let bsb: String?
        let accountNumber: String?
        
        func createDic() -> [String: Any]? {
            guard let dic = self.dictionary else {
                return nil
            }
            
            return dic
        }
    }
    
}

struct DeliveryCityInfo: Codable {
    
    let cityName: String
    let transportProvider: TransportProvider
    let depotProvider: DepotProvider
    
    func createDic() -> [String: Any]? {
        guard let dic = self.dictionary else {
            return nil
        }
        
        return dic
    }
}

struct TransportProvider: Codable {
    let name: String
    let businessName: String
    let mobileNumber: String
    
    func createDic() -> [String: Any]? {
        guard let dic = self.dictionary else {
            return nil
        }
        
        return dic
    }
}

struct DepotProvider: Codable {
    let businessName: String
    let mobileNumber: String
    let address: String
    
    func createDic() -> [String: Any]? {
        guard let dic = self.dictionary else {
            return nil
        }
        
        return dic
    }
}


//MARK: - Extension for Encodable

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
