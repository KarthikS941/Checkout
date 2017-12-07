//
//  CHKProductsResponse.swift
//  WalmartCheckout
//
//  Created by Karthik S on 11/20/17.
//  Copyright © 2017 Karthik S. All rights reserved.
//
struct CHKProductsResponse : Codable {
    let products : [CHKProduct]?    // Products List
    let totalProducts : Int?        // Total Product Count
    let pageNumber : Int?           // Current Page Number
    let pageSize : Int?            // Page Size
    let status : Int?               // Status of Response
    let kind : String?              // Kind of Response
    let etag : String?              // Tag
    let id : String?               // ID
}
