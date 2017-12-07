//
//  CHKConstants.swift
//  WalmartCheckout
//
//  Created by Karthik S on 11/20/17.
//  Copyright © 2017 Karthik S. All rights reserved.
//
import Foundation
// Constants used in Walmart Checkout App
struct CHKConstants {
    // Walmart URL
    static let requestURL = "https://walmartlabs-test.appspot.com/_ah/api/walmart/v1"
    // Walmart API Key
    static let requestAPIKey = "0542d91d-de6f-4a87-a857-dec3b214454d"
    // Walmart Product Parameter
    static let requestProducts = "walmartproducts"
    // Default Page Size Count
    static let defaultPageSize = 20
    
    // Product Cell Identifier
    static let productCellIdentifier = "productCell"
    
    // Segue for Product Detail
    static let productDetailSegue = "showProductDetailView"
    
    // Product Refesh Rate
    static let productRefreshRate = 0.8 // In Percent its 80%, When 80% products are shown refesh will happen to load more items
}
