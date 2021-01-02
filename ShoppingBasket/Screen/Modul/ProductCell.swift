//
//  ProductCell.swift
//  ShoppingBasket
//
//  Created by MacBook on 19.12.2020.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    var product:Product?
    
    weak var addToBasketDelegate:AddToBasketDelegate?
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var btnFavorite: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBAction func addFavorite(_ sender: Any) {
        
        let nc = NotificationCenter.default
        
        
        if(!BaseData.sharedInstance.isProductFavorite(productId: product!.iD!)){
            BaseData.sharedInstance.addFavoriteProduct(product: product!)
            self.btnFavorite.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
        }else{
            self.btnFavorite.setImage(UIImage.init(systemName: "heart"), for: .normal)
            
            BaseData.sharedInstance.removeFavoriteProduct(product: product!)
        }
        
        nc.post(name: Notification.Name("ChangeFavoriteProduct"), object: nil)
    }
    
    
    @IBAction func onClickAddToBasket(_ sender: UIButton) {
        if(addToBasketDelegate != nil) {
            addToBasketDelegate?.addToBasket(product: product!)
        }
        
    }
    
    
    func setData(product:Product) {
        self.product = product
        if(BaseData.sharedInstance.isProductFavorite(productId: (product.iD)!)) {
            self.btnFavorite.setImage(UIImage(systemName: "heart.fill"),for:.normal)
        }else {
            self.btnFavorite.setImage(UIImage(systemName: "heart"),for:.normal)
        }
    }
}
