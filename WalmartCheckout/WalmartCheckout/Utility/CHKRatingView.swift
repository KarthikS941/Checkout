//
//  CHKRatingView.swift
//  WalmartCheckout
//
//  Created by Karthik S on 12/7/17.
//  Copyright © 2017 Karthik S. All rights reserved.
//

import UIKit

class CHKRatingView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    // Set Rating in View
    func setRatingTo(value: Int) {
        // Get all UIImageView SubViews
        for imageview in self.subviews {
            if imageview is UIImageView {
                // Set Positive Values
                if imageview.tag <= value {
                    (imageview as! UIImageView).image = UIImage(named: "RatingOn")
                }
                else {
                    (imageview as! UIImageView).image = UIImage(named: "RatingOff")
                }
            }
        }
    }
}
