//
//  Constants.swift
//  AgriSup
//
//  Created by Sonney Patel on 15/01/2021.
//

import Foundation


struct K {
    
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "ReuseableCheckboxCell"
    
    static let supplierCollection = "suppliers"
    static let productCollection = "products"
    static let customerCollection = "customers"
    
    struct UserDefaults {
        static let email = "email"
        static let password = "password"
        static let type = "type"
    }
    
    struct Segues {
        
        struct GettingStartedCustomer {
            static let customerToIdentityInfo = "customerToIdentityInfo"
            static let customerToPhotoInfo = "customerToPhotoInfo"
            static let customerToDeliveryDayInfo = "customerToDeliveryDayInfo"
            static let customerToFinancialInfo = "customerToFinancialInfo"
            static let customerToFinalViewInfo = "customerToFinalViewInfo"
            static let toCustomerHome = "toCustomerHome"
            
        }
        
        
        static let LOGIN_TO_MAIN_VIEW = "LoginToMainView"
        static let REGISTER_TO_GET_STARTED = "RegisterToGetStarted"
        static let REGISTER_TO_GET_STARTED_2 = "RegisterToGetStarted2"
        
        static let straightToSearch = "straightToSearch"
        
        static let toBuySellInfo = "toBuySellInfo"
        static let toCustomerStoryboard = "toCustomerStoryboard"
        static let toNameInfo = "toNameInfo"
        static let toLicenseInfo = "toLicenseInfo"
        static let toPhotoInfo = "toPhotoInfo"
        static let toDeliveryDayInfo = "toDeliveryDayInfo"
        static let toDeliveryCityInfo = "toDeliveryCityInfo"
        static let toFinancialInfo = "toFinancialInfo"
        static let toFinalView = "toFinalView"
        static let toMainPage = "toMainPage"
        
        static let autoLogin = "autoLogin"
        
        //Home page onwards
        static let toProductOrderRequirements = "toProductOrderRequirements"
        static let toHomePage = "toHomePage"
        
        
    }
    
}
