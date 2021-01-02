//
//  BaseScreen.swift
//  ShoppingBasket
//
//  Created by MacBook on 19.12.2020.
//

import UIKit

class BaseScreen: UIViewController {

    
    var baseData:BaseData = BaseData.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
      modifyNavigationController()
    
    }
    

    func modifyNavigationController() {
        // Set Background Color Nil
           navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
           navigationController?.navigationBar.shadowImage = UIImage()
           navigationController?.navigationBar.backgroundColor = .clear
    }

}
