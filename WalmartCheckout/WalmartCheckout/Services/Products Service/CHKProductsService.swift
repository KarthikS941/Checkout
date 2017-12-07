//
//  CHKProductsService.swift
//  WalmartCheckout
//
//  Created by Karthik S on 11/20/17.
//  Copyright © 2017 Karthik S. All rights reserved.
//
import Foundation
// CHKProductsService helps in getting the list of products from
// server with paging
class CHKProductsService {

    // Initialize Products Service
    init() {
        // Initialization
    }
    
    /// Retreives Produts within given page and size.
    ///
    /// - Parameters:
    ///   - page: Page Number
    ///   - pageSize: Page Size
    ///   - completion: Completion Block
    func getProductsFrom(page:Int,
                         completion: @escaping (CHKProductsResponse?,CHKError?) -> Void) {
        let requestUrl =  getSearchUrlWith(page: page)
        // Create a Request  for Products
        CHKNetwork.sharedNetwork.performRequestWith(url:requestUrl, parameters: [:]) { (response, error) in
            
            // Get Object from Data
            let responseObject = try? JSONDecoder().decode(CHKProductsResponse.self, from: response!)
            
            // Check for Valid Response Object
            guard let _ = responseObject else {
                let error = CHKError(code: 404, isSuccess: false, description: "Error from parsing", title: "Error")
                completion(nil, error)
                return
            }
            completion(responseObject,nil)
        }
    }
}

// MARK: - Utility
extension CHKProductsService {
    
    // Compute Complete Search Url
    func getSearchUrlWith(page:Int) -> String {
        return "\(CHKConstants.requestURL)/\(CHKConstants.requestProducts)/\(CHKConstants.requestAPIKey)/\(page)/\(CHKConstants.defaultPageSize)"
    }
}
