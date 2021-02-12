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
    
    static let searchCellIdentifier = "SearchTableCell"
    static let searchCellNibName = "SearchResultsTableViewCell"
    
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
        
        
        struct GettingStartedSupplier {
            static let toSupplierIdentityInfo = "toSupplierIdentityInfo"
            static let toSupplierPictureInfo = "toSupplierPictureInfo"
            static let toSupplierCredentialsInfo = "toSupplierCredentialsInfo"
            static let toSupplierDeliveryDatesInfo = "toSupplierDeliveryDatesInfo"
            static let toSupplierDeliveryCityInfo = "toSupplierDeliveryCityInfo"
            static let toSupplierFinancialInfo = "toSupplierFinancialInfo"
            static let toSupplierFinalViewInfo = "toSupplierFinalViewInfo"
        }
        
        struct Login {
            static let toLoginPage = "toLoginPage"
            static let toCustomerHomePage = "toCustomerHomePage"
            static let toSupplierHomePage = "toSupplierHomePage"
        }
        
        
        static let LOGIN_TO_MAIN_VIEW = "LoginToMainView"
        static let REGISTER_TO_GET_STARTED = "RegisterToGetStarted"
        static let REGISTER_TO_GET_STARTED_2 = "RegisterToGetStarted2"
        
        static let straightToSearch = "straightToSearch"
        
        
        //Might need to get rid of these...
        static let toBuySellInfo = "toBuySellInfo"
        static let toCustomerStoryboard = "toCustomerStoryboard"
        static let toNameInfo = "toNameInfo"
        static let toMainPage = "toMainPage"
        
        static let autoLogin = "autoLogin"
        
        //Home page onwards
        static let toProductOrderRequirements = "toProductOrderRequirements"
        static let toHomePage = "toHomePage"
        
        
    }
    
}
