//
//  Product.swift
//  AgriSup
//
//  Created by Sonney Patel on 26/01/2021.
//

import Foundation


struct Product: Codable {
    
    let supplierId: String
    let name: String
    let description: String
    let growingMethod: String
    let size: String
    let quality: String
    
    let unit: String
    let minOrderQuantity: Int?
    let leadTime: Int?
    let leadTimeUnits: String?
    let samples: Bool?
    let sampleUnits: Int?
    let unitPrice: Double?
    let currency: String?
    
    func createDic() -> [String: Any]? {
        guard let dic = self.dictionary else {
            return nil
        }
        return dic
    }

}



