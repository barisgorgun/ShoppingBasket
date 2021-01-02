//
//  FavoriteScreen.swift
//  ShoppingBasket
//
//  Created by MacBook on 27.12.2020.
//

import UIKit

class FavoriteScreen: BaseScreen {
    
    @IBOutlet weak var tbvFavorite: UITableView!
    
    var favoriteList :[Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoriteList = baseData.getFavoriteList()
        tbvFavorite.reloadData()
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(favoriteListChange), name: Notification.Name("ChangeFavoriteProduct"), object: nil)
    }
    
    @objc func favoriteListChange()  {
        self.favoriteList = baseData.getFavoriteList()
        tbvFavorite.reloadData()
    }
    
    
}

extension FavoriteScreen: AddToBasketDelegate {
    func addToBasket(product:Product) {
        ActionSheet.init(view: self, basketProduct: product)
    }
    
    
}

extension FavoriteScreen : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentify.FavoriteTBVCell, for: indexPath) as! FavoriteTBVCell
        cell.product = favoriteList?[indexPath.row]
        cell.lblBrandName.text = favoriteList?[indexPath.row].brandName
        cell.lblProductName.text = favoriteList?[indexPath.row].productName
        cell.lblPrice.text = "Fiyat: \(favoriteList?[indexPath.row].price ?? 0.0) ₺"
        cell.imgProduct.image = UIImage.init(named: self.favoriteList?[indexPath.row].imageName ?? "")
        cell.addToBasketDelegate = self
        return cell 
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            BaseData.sharedInstance.removeFavoriteProduct(product: (favoriteList?[indexPath.row])!)
            self.favoriteList!.remove(at: indexPath.row)
            self.tbvFavorite.deleteRows(at: [indexPath], with: .fade)
            let nc = NotificationCenter.default
            nc.post(name: Notification.Name("ChangeFavoriteProduct"), object: nil)
        }
    }
    
}
