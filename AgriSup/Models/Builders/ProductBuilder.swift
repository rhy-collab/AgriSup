//
//  ProductBuilder.swift
//  AgriSup
//
//  Created by Sonney Patel on 26/01/2021.
//

import Foundation

class ProductBuilder {
    
    static let builder = ProductBuilder()
    
    private init() {}
    
    
    var supplierId: String = ""
    var name: String = ""
    var description: String = ""
    var growingMethod: String = ""
    var size: String = ""
    
    var unit: String = ""
    var minOrderQuantity: Int = 0
    var leadTime: Int = 0
    var leadTimeUnits: String = ""
    var samples: Bool = false
    var sampleUnits: Int = 0
    var unitPrice: Double = 0.0

    
    func setSupplierID(supplierID: String) {
        self.supplierId = supplierID
    }
    
    func setProductDetails(name: String, description: String, growingMethod: String, size: String, price: Double) {
        self.name = name
        self.description = description
        self.growingMethod = growingMethod
        self.size = size
        self.unitPrice = price
    }
    
    
    func setOrderRequirements(unit: String, minOrderQuantity: Int, leadTime: Int, leadTimeUnits: String, samples: Bool, sampleUnits: Int) {
        self.unit = unit
        self.minOrderQuantity = minOrderQuantity
        self.leadTime = leadTime
        self.leadTimeUnits = leadTimeUnits
        self.samples = samples
        self.sampleUnits = sampleUnits
    }
    
    func build() -> Product {
        return Product(supplierId: supplierId, name: name, description: description, growingMethod: growingMethod, size: size, unit: unit, minOrderQuantity: minOrderQuantity, leadTime: leadTime, leadTimeUnits: leadTimeUnits, samples: samples, sampleUnits: sampleUnits, unitPrice: unitPrice)
    }
    
}
