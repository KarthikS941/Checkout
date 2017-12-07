//
//  CHKHomeViewController.swift
//  WalmartCheckout
//
//  Created by Karthik S on 11/20/17.
//  Copyright © 2017 Karthik S. All rights reserved.
//

import UIKit

class CHKHomeViewController: UIViewController {
    
    // View Model
    var homeViewModel = CHKHomeViewModel()
    
    // Product Request in Progress
    var productRequestInProgress = false
    
    // Outlets
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var ratingView: CHKRatingView!
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        productsTableView.estimatedRowHeight = 144
        productsTableView.rowHeight = UITableViewAutomaticDimension


        
        // Referesh Products List
        refreshProductsList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Used to refresh products list
    func refreshProductsList() {
        // Check if total products are available before making a request and if any refresh is in progress
        if !homeViewModel.allProductsAvailable() && !productRequestInProgress {
            productRequestInProgress = true // Turn Product Request to True
            // Get 20 products
            homeViewModel.getProducts {
                DispatchQueue.main.async {
                    // Reload Table View
                    self.productsTableView.reloadData()
                    self.productRequestInProgress = false
                }
            }
        }
    }
}

// MARK: - Table View
extension CHKHomeViewController: UITableViewDelegate , UITableViewDataSource {
    
    // Cell Design and populate data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CHKProductCell = productsTableView.dequeueReusableCell(withIdentifier: CHKConstants.productCellIdentifier) as! CHKProductCell
        cell.productName.text = homeViewModel.productsCache.products![indexPath.row].productName ?? ""
        cell.productDescription.text = homeViewModel.productsCache.products! [indexPath.row].shortDescription ?? ""
        cell.productImage.loadImageFrom(url: homeViewModel.productsCache.products! [indexPath.row].productImage ?? "")
        cell.ratingView.setRatingTo(value: Int(homeViewModel.productsCache.products! [indexPath.row].reviewRating ?? 0.0))
        cell.priceLabel.text = homeViewModel.productsCache.products! [indexPath.row].price ?? ""
        cell.inStock(value: homeViewModel.productsCache.products! [indexPath.row].inStock ?? false)
        return cell
    }
    
    // Number of Sections in Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.productsCache.products!.count
    }
    
    // Will Display Cell
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Check if user is about to reach bottom of screen
        if Double(indexPath.row) >= CHKConstants.productRefreshRate * Double(homeViewModel.productsCache.products!.count) {
            // Refesh List
            refreshProductsList()
        }
    }
    
    // Prepare Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Check for Detail View Navigation
        if segue.identifier == CHKConstants.productDetailSegue {
            // Set Current Selected Product
            homeViewModel.currentSelectedProduct = homeViewModel.productsCache.products![(self.productsTableView.indexPathForSelectedRow?.row)!]

            // Set Current Selected Product
            let productDetailVC = segue.destination as! CHKProductDetailViewController
            productDetailVC.detailViewModel.currentProduct = homeViewModel.currentSelectedProduct
        }
    }
}

