//
//  FavoriteTBVCell.swift
//  ShoppingBasket
//
//  Created by MacBook on 27.12.2020.
//

import UIKit

protocol AddToBasketDelegate: class {
    func addToBasket(product: Product)
}

class FavoriteTBVCell: UITableViewCell {

    @IBOutlet weak var lblBrandName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    
    var product:Product?
    
    weak var addToBasketDelegate:AddToBasketDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func onClickAddBasket(_ sender: UIButton) {
        if (addToBasketDelegate != nil) {
            addToBasketDelegate?.addToBasket(product: product!)
        }
    }
    
}
