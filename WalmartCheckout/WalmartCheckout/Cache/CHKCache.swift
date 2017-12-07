//
//  CHKCache.swift
//  WalmartCheckout
//
//  Created by Karthik S on 12/5/17.
//  Copyright © 2017 Karthik S. All rights reserved.
//

import Foundation

class CHKCache {
    // List of products from server
    var products : [CHKProduct]?
    // Total Products
    var totalProducts : Int?
    
    // Singleton Shared Cache
    static let sharedCache = CHKCache()
    
    // Initialization
    private init(){
        // Initialization
        self.totalProducts = 0
        self.products = [CHKProduct]()
    }
    
    // Check if all products are loaded in cache
    func allProductsLoaded() -> Bool {
        if self.products!.count >= self.totalProducts! {
            return true
        }
        return false
    }
}
