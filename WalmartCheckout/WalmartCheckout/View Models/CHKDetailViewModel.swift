//
//  CHKDetailViewModel.swift
//  WalmartCheckout
//
//  Created by Karthik S on 12/5/17.
//  Copyright © 2017 Karthik S. All rights reserved.
//

import Foundation

class CHKDetailViewModel {
    
    // Products Cache
    var productsCache  = CHKCache.sharedCache
    
    // Current Product
    var currentProduct : CHKProduct?
    
    // Product Service
    var productService = CHKProductsService()
    
    // Initialization
    init() {
        // Set All Default Values
        self.currentProduct = nil
    }
    
    // Next Product
    func nextProduct() {
        // Check if user needs more products when they reach 80%
        let indexOfCurrentProduct = productsCache.products?.index(of: self.currentProduct!)
        if indexOfCurrentProduct! < (productsCache.products?.count)!-1 {
        // Refresh Index
        let indexOfRefresh = Double(productsCache.products!.count) * CHKConstants.productRefreshRate
        // Check if New Products needs to be fetched
        if Double(indexOfCurrentProduct!) >= indexOfRefresh {
            // Get New List
            // Make a Network call to get all details of products
            productService.getProductsFrom(page: ((productsCache.products?.count)!/CHKConstants.defaultPageSize) + 1) { (response, error) in
                // Append Products
                self.productsCache.products!.append(contentsOf: response!.products!)
                // Total Products
                self.productsCache.totalProducts = response!.totalProducts
            }
        }
        
        // Load Next Product
        let nextProduct = (productsCache.products?[indexOfCurrentProduct!+1])!
        self.currentProduct = nextProduct
        }
    }
    
    // Previous Product
    func previousProduct() {
        // Check if user needs more products when they reach 80%
        let indexOfCurrentProduct = productsCache.products?.index(of: self.currentProduct!)
        if indexOfCurrentProduct! != 0 {
        let prevProduct = (productsCache.products?[indexOfCurrentProduct!-1])!
        self.currentProduct = prevProduct
        }
    }
}
