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
    var inviteCode: Int
    
    func createDic() -> [String: Any]? {
        guard let dic = self.dictionary else {
            return nil
        }
        
        return dic
    }

    
    struct Credentials: Codable {
        let abn: String?
        let farmingLicense: String?
        let drivingLicense: String?
        
//        init?(data: [String: Any]) {
//            guard let abn = data["abn"] as? String,
//                  let farmingLicense = data["farmingLicense"] as? String,
//                  let drivingLicense = data["drivingLicense"] as? String else {
//                return nil
//            }
//
//            self.abn = abn
//            self.farmingLicense = farmingLicense
//            self.drivingLicense = drivingLicense
//        }
        
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
        
//        init?(data: [String: Any]) {
//            guard let accountName = data["accountName"] as? String,
//                  let bsb = data["bsb"] as? String,
//                  let accountNumber = data["accountNumber"] as? String else {
//                return nil
//            }
//
//            self.accountName = accountName
//            self.bsb = bsb
//            self.accountNumber = accountNumber
//        }
        
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
