//
//  CHKProductCell.swift
//  WalmartCheckout
//
//  Created by Karthik S on 12/4/17.
//  Copyright © 2017 Karthik S. All rights reserved.
//

import UIKit

class CHKProductCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingView: CHKRatingView!
    @IBOutlet weak var inStockView: UIView!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    
    func inStock(value:Bool) {
        if value {
            self.inStockView.isHidden = false
            return
        }
        self.inStockView.isHidden = true
    }
}
