//
//  CHKHomeViewModel.swift
//  WalmartCheckout
//
//  Created by Karthik S on 11/20/17.
//  Copyright © 2017 Karthik S. All rights reserved.
//
import Foundation
class CHKHomeViewModel {
    
    // Products Cache
    var productsCache  = CHKCache.sharedCache

    // Current Page
    var currentPage : Int?
    
    // Current Selected Product
    var currentSelectedProduct : CHKProduct!
    
    // Product Service
    var productService = CHKProductsService()
    
    // Initialization
    init() {
        // Set All Default Values
        self.currentPage = 0
    }
    
    // Get Products from Home View Model
    func getProducts(completion: @escaping () -> Void) {
        // Make a Network call to get all details of products
        productService.getProductsFrom(page: self.currentPage! + 1) { (response, error) in
            // Get Current Page Value
            self.currentPage = response!.pageNumber
            // Append Products
            self.productsCache.products!.append(contentsOf: response!.products!)
            // Total Products
            self.productsCache.totalProducts = response!.totalProducts
            completion()
        }
    }
    
    // Check if all products are available
    func allProductsAvailable() -> Bool {
        if self.currentPage != 0 && self.productsCache.allProductsLoaded() {
            return true
        }
        return false
    }
}
