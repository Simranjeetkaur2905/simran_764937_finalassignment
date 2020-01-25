//
//  product.swift
//  simran_764937_finalassignment
//
//  Created by Simran Chakkal on 2020-01-24.
//  Copyright © 2020 simran. All rights reserved.
//

import Foundation

class Product{
    
    init(productName: String, productId: String, productDescription: String, price: Int) {
        self.productName = productName
        self.productId = productId
        self.productDescription = productDescription
        self.price = price
    }
    
    
    var productName: String
    var productId: String
    var productDescription: String
    var price: Int
    
}
