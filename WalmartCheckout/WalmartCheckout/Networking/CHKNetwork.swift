//
//  CHKNetwork.swift
//  WalmartCheckout
//
//  Created by Karthik S on 11/20/17.
//  Copyright © 2017 Karthik S. All rights reserved.
//
import Foundation

public class CHKNetwork {
    
    // Singleton Shared Network
    static let sharedNetwork = CHKNetwork()
    
    // Initialization
    private init(){
        // Initialization
    }
    
    /// Make a Network Request using URLSession and Data Task
    ///
    /// - Parameters:
    ///   - url: Url to which  be requested
    ///   - parameters: Url Parameter
    ///   - completion: Completion Block
    func performRequestWith(url: String,
                            parameters : [String: String],
                            completion:  @escaping (Data?, Error?) -> Void) {
        // URL Components
        var components = URLComponents(string: url)!
        components.queryItems = parameters.map {(key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        // TODO Check for components null
        // URL Request
        let request = URLRequest(url: components.url!)
        
        // Data Task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Check if there is valid reponse data and response
            guard let data = data, error == nil else {
                // No Valid Data
                completion(nil, error)
                return
            }
            // On Successful response
            print(data)
            completion(data, nil)
        }
        task.resume()
    }
}
