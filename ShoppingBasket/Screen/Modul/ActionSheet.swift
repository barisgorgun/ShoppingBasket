//
//  ActionSheet.swift
//  ShoppingBasket
//
//  Created by MacBook on 28.12.2020.
//

import UIKit

class ActionSheet: UIViewController {
    
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var cnsMenuBottom: NSLayoutConstraint!
    
    @IBOutlet weak var lblProductName: UILabel!
    var basketProduct:Product?
    var productCount : Int?
    
    
    var topLimit = -40
    var bottomLimit = -500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblTitle.text = basketProduct?.brandName
        self.lblProductName.text = basketProduct?.productName
        self.lblPrice.text = "\(basketProduct?.price ?? 0.0) ₺"
        self.imgProduct.image = UIImage(named: basketProduct?.imageName ?? "")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickStepper(_ sender: UIStepper) {
        lblCount.text = "\(sender.value)"
        productCount = Int(sender.value)
        
    }
    
    @IBAction func onClickAddToBasket(_ sender: UIButton) {
        let nc = NotificationCenter.default
        if ( basketProduct != nil && productCount != nil) {
            BaseData.sharedInstance.addProductBasket(product: basketProduct!, count: productCount!)
            nc.post(name:Notification.Name("ChangeBasketProduct"),object: nil)
            closeScreen()
        }else{
            let alert = UIAlertController(title: "Miktar 0 olamaz", message: "Lütfen Sepete Eklemek İstediğiniz Miktarı Giriniz", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .destructive, handler: {(action: UIAlertAction!) in  self.closeScreen() }))
            self.present(alert, animated: true)
        }
        
       
        
    }
    
    
    
    @IBAction func onClickMenuOutside(_ sender: Any) {
        closeScreen()
    }
    @IBAction func onClickClose(_ sender: UIButton) {
        closeScreen()
    }
    
    
    @IBAction func menuActionSheetPanGesture(_ sender: UIPanGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.began {
            // nothing
            
            // vwActionSheet.backgroundColor = UIColor.red
            /**
             action sheet view rengini degitirebilirsiniz
             */
            
        } else if sender.state == UIGestureRecognizer.State.changed {
            let translationY = sender.translation(in: sender.view).y
            if translationY > 0 {
                
                //  self.vwActionSheet.alpha = 1 - translationY/400
                self.cnsMenuBottom.constant = CGFloat(topLimit) - translationY
            } else {
                self.cnsMenuBottom.constant = CGFloat(topLimit) - (translationY / 8)
            }
        }else {
            // vwActionSheet.backgroundColor = UIColor.white
            
            if cnsMenuBottom.constant < -100 {
                closeScreen()
            } else {
                setMenuInitialState()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setMenuInitialState()
    }
    
    func setMenuInitialState() {
        self.cnsMenuBottom.constant = CGFloat(topLimit)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            
            
        })
    }
    
    
    func closeScreen() {
        //delegate?.notifyCityScreenClose()
        self.cnsMenuBottom.constant = CGFloat(bottomLimit)
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.clear
            self.view.layoutIfNeeded()
        }, completion: { (_) in
            self.dismiss(animated: true, completion: nil)
        })
    }
  
    
}


extension ActionSheet {
    public convenience init(view: UIViewController, basketProduct:Product) {
        self.init(nibName: "ActionSheet", bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        self.basketProduct = basketProduct
        view.present(self, animated: false, completion: nil)
    }
    
}
