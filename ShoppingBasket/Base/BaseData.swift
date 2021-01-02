//
//  BaseData.swift
//  ShoppingBasket
//
//  Created by MacBook on 19.12.2020.
//

import Foundation

class BaseData {
    
    static var sharedInstance = BaseData()
    
    private init(){
        
    }
    private var favoriteList:[Product] = [Product]()
    var basketList : [BasketProductModel] = [BasketProductModel]()
    
  
    
    func getFavoriteList() -> [Product] {
        return favoriteList
    }
    
    
    func addFavoriteProduct(product:Product)  {
        if(!isProductFavorite(productId: product.iD!)){
            favoriteList.append(product)
        }
    }
    
    func removeFavoriteProduct(product:Product) {
        var removeIndex = -1
        for (index,item) in favoriteList.enumerated(){
            if(item.iD == product.iD){
                removeIndex = index
            }
        }
        
        if(removeIndex != -1){
            favoriteList.remove(at: removeIndex)
        }
    }
    
    
    func basketProductCountChange(product:Product,count:Int)  {
        for (index,item) in basketList.enumerated() {
            if (item.product?.iD == product.iD) {
                basketList[index].count = count
            }
        }
    }
    
    
    func isProductFavorite(productId:Int) -> Bool {
        for product in favoriteList {
            if(product.iD == productId){
                return true
            }
        }
        return false
    }
    

    func addProductBasket(product:Product,count:Int)  {
        
        var isAddedBefore = false
        for (index,item) in basketList.enumerated() {
            if (item.product?.iD == product.iD) {
                basketList[index].count = count +  basketList[index].count
               
                isAddedBefore = true
            }
        }
        if(isAddedBefore == false){
            
            basketList.append(BasketProductModel.init(product: product, count: count))
        }
    }
    
  
    
    func getBasketProductList() -> [BasketProductModel] {
        return basketList
    }
        
    func basketTotalPrice() -> Double {
        var totalPrice: Double = 0.0
        for basketProduct in self.basketList {
            totalPrice = totalPrice + (Double(basketProduct.count) * (basketProduct.product?.price)!)
            }
        
        return totalPrice
        }
    func removeProductBasket(basketProduct: BasketProductModel)  {
        
        var indexItem = 0
        
        for (index,item) in basketList.enumerated() {
            if (item.product?.iD == basketProduct.product?.iD) {
                indexItem = index
                
            }
        }
        basketList.remove(at: indexItem)
    }
    
    
    }
   /*
    
   
    
    
   
    func getBasketProduct(basketProduct: BasketProductModel) -> BasketProductModel? {
        var basketProductDummy : BasketProductModel?
        for (index,item) in basketProductList.enumerated() {
            if (item.product?.iD == basketProduct.product?.iD) {
                basketProductDummy = basketProductList[index]
            }
        }
        return basketProductDummy
    }
   

}
 */
