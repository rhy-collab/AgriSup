//
//  Customer.swift
//  AgriSup
//
//  Created by Sonney Patel on 10/02/2021.
//

import Foundation
import FirebaseFirestoreSwift

struct Customer: Codable {
    
    let firstName: String
    let lastName: String
    let mobileNumber: String
    let email: String
    let photo: [String]
    let deliveryDates: [String]//enum?
    let financialInfo: FinancialInfo
    
    func createDic() -> [String: Any]? {
        guard let dic = self.dictionary else {
            return nil
        }
        
        return dic
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
