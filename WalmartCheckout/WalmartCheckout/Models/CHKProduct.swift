//
//  CHKProduct.swift
//  WalmartCheckout
//
//  Created by Karthik S on 11/20/17.
//  Copyright © 2017 Karthik S. All rights reserved.
//
struct CHKProduct : Codable, ProductEquatable {
    let productId : String?         // Product Id
    let productName : String?       // Product Name
    let shortDescription : String?  // Short Description
    let longDescription : String?  // Long Description
    let price : String?            // Price
    let productImage : String?      // Product Image
    let reviewRating : Double?         // Review Rating
    let reviewCount : Int?          // Review Count
    let inStock : Bool?             // In Stock
}

// MARK : Making CHKProduct Equatable
// Equatble Protocol
protocol ProductEquatable: Equatable {
    var productId: String? { get }
}

// Protocol Extension
extension ProductEquatable {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.productId == rhs.productId
    }
}
