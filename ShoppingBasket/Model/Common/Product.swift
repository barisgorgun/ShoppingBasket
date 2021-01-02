//
//  Product.swift
//  ShoppingBasket
//
//  Created by MacBook on 20.12.2020.
//

import Foundation
class  Product{
    var iD:Int?
    var brandId:Int?
    var subCategoryId:Int?
    var productName:String?
    var imageName:String?
    var price: Double?
    var brandName: String?

    
    init(id:Int,brandId:Int,brandName:String,subCategoryId:Int,productName:String,imageName:String,price:Double) {
        self.iD = id
        self.brandId = brandId
        self.subCategoryId = subCategoryId
        self.productName = productName
        self.imageName = imageName
        self.price = price
        self.brandName = brandName
        
        }
}
