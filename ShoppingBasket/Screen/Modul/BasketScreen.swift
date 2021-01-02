//
//  BasketScreen.swift
//  ShoppingBasket
//
//  Created by MacBook on 29.12.2020.
//

import UIKit

class BasketScreen: BaseScreen {
    
   
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var tbvBasketList: UITableView!
    var basketList : [BasketProductModel] = [BasketProductModel]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        basketList = BaseData.sharedInstance.getBasketProductList()
        tbvBasketList.reloadData()
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(basketListChange), name: Notification.Name("ChangeBasketProduct"), object: nil)
        nc.addObserver(self, selector: #selector(basketListChange), name: Notification.Name("ChangeProductCount"), object: nil)
        
        basketTotalPrice()
    }
    
    @objc func basketListChange()  {
        self.basketList = BaseData.sharedInstance.getBasketProductList()
        tbvBasketList.reloadData()
        basketTotalPrice()
    }
    
    
    func basketTotalPrice() {
        var totalPrice: Double = 0.0
        for basketProduct in basketList {
            totalPrice = totalPrice + (Double(basketProduct.count) * (basketProduct.product?.price)!)
        }
        lblTotalPrice.text = "\(totalPrice) ₺"
    }
 
    @IBAction func onClickButtomCargo(_ sender: Any) {
   
          
        
    }
    
    
    
}

extension BasketScreen:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentify.BasketCell, for: indexPath) as! BasketCell
        cell.setViewData(product: (basketList[indexPath.row]))
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            BaseData.sharedInstance.removeProductBasket(basketProduct: basketList[indexPath.row])
            self.basketList.remove(at: indexPath.row)
            self.tbvBasketList.deleteRows(at: [indexPath], with: .fade)
            basketTotalPrice()
            
            
        }
    }
    
}
