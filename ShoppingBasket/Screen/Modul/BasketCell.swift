//
//  BasketCell.swift
//  ShoppingBasket
//
//  Created by MacBook on 29.12.2020.
//

import UIKit

class BasketCell: UITableViewCell{
 
    

    @IBOutlet weak var lblProductBrand: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var btnCount: UIButton!
    var product : BasketProductModel?
  
    
    
    var numbers:[Int] = [1,2,3,4,5,6,7,8,9,10]
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    func setViewData(product:BasketProductModel) {
        self.product = product
        imgProduct.image = UIImage(named: product.product?.imageName ?? "")
        lblProductBrand.text = product.product?.brandName
        lblProductName.text = product.product?.productName
        btnCount.setTitle("Adet:\(product.count)", for: .normal)
        var totalPrice = Double(product.count)  * ((product.product?.price)!)
        lblProductPrice.text = "\(totalPrice) ₺"
      
        
    }
    
    @IBAction func onClickProductCount(_ sender: UIButton) {
        picker = UIPickerView.init()
            picker.delegate = self
            picker.dataSource = self
            picker.backgroundColor = UIColor.white
            picker.setValue(UIColor.black, forKey: "textColor")
            picker.autoresizingMask = .flexibleWidth
            picker.contentMode = .center
            picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 400, width: UIScreen.main.bounds.size.width, height: 300)
           superview?.addSubview(picker)
                    
            toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 400, width: UIScreen.main.bounds.size.width, height: 50))
            toolBar.barStyle = .default
            toolBar.items = [UIBarButtonItem.init(title: "Kapat", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        superview?.addSubview(toolBar)
        
        
        
    }
    
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    
   
}

extension BasketCell : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numbers[row])"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        btnCount.setTitle("Adet:\(numbers[row])", for: .normal)
        BaseData.sharedInstance.basketProductCountChange(product: (product?.product)!, count: numbers[row])
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("ChangeProductCount"), object: nil)
        

    }

}
