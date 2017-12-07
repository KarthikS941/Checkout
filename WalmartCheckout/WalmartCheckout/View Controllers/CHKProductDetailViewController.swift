//
//  CHKProductDetailViewController.swift
//  WalmartCheckout
//
//  Created by Karthik S on 12/5/17.
//  Copyright © 2017 Karthik S. All rights reserved.
//

import UIKit

class CHKProductDetailViewController: UIViewController {
    
    // Detail View Model
    var detailViewModel = CHKDetailViewModel()
    
    @IBOutlet weak var inStock: UILabel!
    @IBOutlet weak var ratingView: CHKRatingView!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addGesturesToView()   // Adding Gestures to View to enable product switch
        
        loadProduct()
        
        showInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Add Gestures to View
    func addGesturesToView() {
        // Adding Right Swipe to View
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeHappen))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        // Adding Left Swipe to View
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeHappen))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        // Gestures
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    // Show Alert
    func showInfo() {
        let alertMessage = UIAlertController(title: "Info", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        action.setValue(UIImage(named: "Alert")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), forKey: "image")
        alertMessage .addAction(action)
        self.present(alertMessage, animated: true, completion: nil)
    }
    
    // Swipe Hanlding
    @objc func didSwipeHappen( gestureReg: UIGestureRecognizer) {
        // Check for Swipe Gesture
        if let swipeGesture = gestureReg as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
            case .right:
                detailViewModel.previousProduct()
            case .left:
                detailViewModel.nextProduct()

                
            default:
                break
            }
            
            // Load Current Product
            loadProduct()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func loadProduct() {
        // Set Name as Navigation Title
        self.title = detailViewModel.currentProduct!.productName ?? ""
        // Set Product Image
        productImageView.loadImageFrom(url: detailViewModel.currentProduct!.productImage ?? "")
        // Set Price
        productPrice.text = detailViewModel.currentProduct!.price ?? ""
        // Set Rating
        ratingView.setRatingTo(value: Int(detailViewModel.currentProduct!.reviewRating ?? 0.0))
        // Product Description
        productDescription.text = detailViewModel.currentProduct!.longDescription ?? ""
        // In Stock
        inStock.isHidden = !(detailViewModel.currentProduct!.inStock ?? false)
    }
}
