//
//  CHKUtility.swift
//  WalmartCheckout
//
//  Created by Karthik S on 12/4/17.
//  Copyright © 2017 Karthik S. All rights reserved.
//

import UIKit

// Common Error Struct for Network Requests
struct CHKError  {
    let code : Int?             // Error Code
    let isSuccess : Bool?        // Sucess Call
    let description : String?    //  Description
    let title : String?          // Error Title
}


// UIImage View Extension
extension UIImageView {
    
    // Load Image from url asynchronously
    public func loadImageFrom(url: String) {
        
        // Create a URL Session Task to download image
        URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "Download Error")
                return
            }
            // Asyn Load to main queue
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}
